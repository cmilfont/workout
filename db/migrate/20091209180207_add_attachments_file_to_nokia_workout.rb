class AddAttachmentsFileToNokiaWorkout < ActiveRecord::Migration
  def self.up
    add_column :nokia_workouts, :file_file_name, :string
    add_column :nokia_workouts, :file_content_type, :string
    add_column :nokia_workouts, :file_file_size, :integer
  end

  def self.down
    remove_column :nokia_workouts, :file_file_name
    remove_column :nokia_workouts, :file_content_type
    remove_column :nokia_workouts, :file_file_size
  end
end

