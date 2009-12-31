class CreateTrainings < ActiveRecord::Migration
  def self.up
    create_table :trainings do |t|
      t.belongs_to :exercise
      t.belongs_to :workout
      t.datetime :start
      t.datetime :finish
      t.integer :health_frequency
      #t.integer :distance
      t.integer :effort

      t.string :lapdistance
      t.timestamp :laptime
      t.timestamp :totaltime
      t.string :distance
      t.string :totaldistance
      t.string :latitude
      t.string :longitude
      t.string :altitude
      t.string :speed
      t.string :pace

      # para exercicios de força
      t.decimal :weight, :precision => 7, :scale => 3
      #repetition em ingles ligado a workout
      t.integer :reps

      t.timestamps
    end
  end

  def self.down
    drop_table :trainings
  end
end

