class CreateTagsOfExercises < ActiveRecord::Migration
  def self.up
    create_table :tags_of_exercises do |t|
      t.string :name
      t.belongs_to :user
      t.belongs_to :exercise

      t.timestamps
    end
  end

  def self.down
    drop_table :tags_of_exercises
  end
end
