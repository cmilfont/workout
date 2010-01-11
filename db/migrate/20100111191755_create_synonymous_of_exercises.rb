class CreateSynonymousOfExercises < ActiveRecord::Migration
  def self.up
    create_table :synonymous_of_exercises do |t|
      t.string :synonym
      t.belongs_to :user
      t.belongs_to :exercise

      t.timestamps
    end
  end

  def self.down
    drop_table :synonymous_of_exercises
  end
end
