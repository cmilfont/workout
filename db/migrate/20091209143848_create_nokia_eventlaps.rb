class CreateNokiaEventlaps < ActiveRecord::Migration
  def self.up
    create_table :nokia_eventlaps do |t|
      t.belongs_to :nokia_workout
      t.string :lapdistance
      t.string :laptime
      t.string :totaltime
      t.string :realtime
      t.string :distance
      t.string :totaldistance
      t.string :latitude
      t.string :longitude
      t.string :altitude
      t.string :speed
      t.string :pace
      t.string :fixquality

      t.timestamps
    end
  end

  def self.down
    drop_table :nokia_eventlaps
  end
end

