class CreateVideosOfExercises < ActiveRecord::Migration
  def self.up
    create_table :videos_of_exercises do |t|
      t.string :url
      t.belongs_to :user
      t.belongs_to :exercise

      t.timestamps
    end
  end

  def self.down
    drop_table :videos_of_exercises
  end
end
