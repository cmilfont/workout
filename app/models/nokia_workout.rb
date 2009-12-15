class NokiaWorkout < ActiveRecord::Base

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => ['text/xml']

  def import(url)
    url = RAILS_ROOT + "/public/files/" + self.id.to_s + "/original/" + self.file_file_name
    xml = Nokogiri::XML(open(url))

    ["oid", "version", "distance", "starttime", "stoptime", "realtime", "totaltime", "features"].map {|item|
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

    laps = xml.search('lap')
    laps.enum_with_index.collect { |item, index|


script/generate scaffold nokia_eventlaps nokia_workout:belongs_to lapdistance:decimal laptime:timestamp totaltime:timestamp realtime:timestamp distance:decimal totaldistance:decimal latitude:decimal longitude:decimal altitude:integer speed:decimal pace:time fixquality:integer

      titulo = item.search('title').first.content
      link = item.search('link').first.content
      resumo = item.search('description').first.content
      data = item.search('pubDate').first.content

    }
  end

end

