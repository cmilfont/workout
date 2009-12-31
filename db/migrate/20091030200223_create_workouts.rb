class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|

      t.belongs_to :user

      t.timestamp :starttime
      t.timestamp :stoptime
      t.timestamp :realtime
      t.timestamp :totaltime
      t.string :distance
      t.string :speed_average
      t.string :speed_max
      t.string :pace_average
      t.string :pace_max

      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end
end

