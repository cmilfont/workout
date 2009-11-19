class CreateTypesOfExercises < ActiveRecord::Migration
  def self.up
    create_table :types_of_exercises do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :types_of_exercises
  end
end
