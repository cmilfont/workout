class CreateTrainings < ActiveRecord::Migration
  def self.up
    create_table :trainings do |t|
      t.belongs_to :exercise
      t.belongs_to :workout
      t.datetime :start
      t.datetime :finish
      t.integer :health_frequency
      t.integer :distance
      t.integer :effort

      t.timestamps
    end
  end

  def self.down
    drop_table :trainings
  end
end
