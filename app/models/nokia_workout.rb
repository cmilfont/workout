class NokiaWorkout < ActiveRecord::Base

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => ['text/xml']
  has_many :nokia_eventlaps, :dependent => :destroy
  belongs_to :user
  validates_presence_of :user

  #after_save :import
  before_save :before_import

  validate :import

  def import
    xml = Nokogiri::XML(open(self.file.to_file.path))
    @oid = xml.root.search("oid").first.content
    if NokiaWorkout.find_by_oid @oid.to_s
      errors.add(:file, "Arquivo já importado!")
    end
  end

  def before_import
    xml = Nokogiri::XML(open(self.file.to_file.path))
    self.oid = xml.root.search("oid").first.content
    import_workout(xml)
    laps = xml.search('lap')
    laps.enum_with_index.collect { |item, index|
      self.nokia_eventlaps << import_lap(item)
    }
  end

  def import_workout(xml)
    ["version", "distance", "starttime", "stoptime", "realtime", "totaltime", "features"].map {|item|
      #DateTime.strptime("19/11/2009 19:51:52", '%d/%m/%Y %H:%M:%S')
      #tempo = DateTime.strptime("00:44:34.10", '%H:%M:%S.%L')
       self[item.to_sym] = xml.root.search(item).first.content
    }
    ["average", "max"].map {|item|
      self[("speed_" + item).to_sym] = xml.root.search("speed").search(item).first.content
      self[("pace_" +  item).to_sym] = xml.root.search("pace").search(item).first.content
    }
    ["minaltitude", "maxaltitude", "ascent", 'descent'].map {|item|
      self[("verticalmovement_" + item).to_sym] = xml.root.search("verticalmovement").search(item).first.content
    }
    self["activity_oid".to_sym] = xml.root.search("activity").search("oid").first.content
    self["activity_name".to_sym] = xml.root.search("activity").search("name").first.content
  end

  def import_lap(item)
    @nokia_eventlap = NokiaEventlap.new(
    :lapdistance   => item.search('lapdistance').first.content ,
    :laptime       => item.search('laptime').first.content ,
    :totaltime     => item.search('eventlocation').search('totaltime').first.content ,
    :realtime      => item.search('eventlocation').search('realtime').first.content ,
    :distance      => item.search('eventlocation').search('distance').first.content ,
    :totaldistance => item.search('eventlocation').search('totaldistance').first.content ,
    :latitude      => item.search('eventlocation').search('latitude').first.content ,
    :longitude     => item.search('eventlocation').search('longitude').first.content ,
    :altitude      => item.search('eventlocation').search('altitude').first.content ,
    :speed         => item.search('eventlocation').search('speed').first.content ,
    :pace          => item.search('eventlocation').search('pace').first.content ,
    :fixquality    => item.search('eventlocation').search('fixquality').first.content)
    return @nokia_eventlap
  end

end

