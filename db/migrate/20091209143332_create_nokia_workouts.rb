class CreateNokiaWorkouts < ActiveRecord::Migration
  def self.up
    create_table :nokia_workouts do |t|
      t.string :oid
      t.string :version
      t.string :starttime
      t.string :stoptime
      t.string :realtime
      t.string :totaltime
      t.string :distance
      t.string :speed_average
      t.string :speed_max
      t.string :pace_average
      t.string :pace_max
      t.string :features
      t.string :verticalmovement_minaltitude
      t.string :verticalmovement_maxaltitude
      t.string :verticalmovement_ascent
      t.string :verticalmovement_descent
      t.string :activity_oid
      t.string :activity_name

      t.timestamps
    end
  end

  def self.down
    drop_table :nokia_workouts
  end
end

