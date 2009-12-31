class CreateCommentsOfExercises < ActiveRecord::Migration
  def self.up
    create_table :comments_of_exercises do |t|
      t.text :comment
      t.belongs_to :user
      t.belongs_to :exercise

      t.timestamps
    end
  end

  def self.down
    drop_table :comments_of_exercises
  end
end
