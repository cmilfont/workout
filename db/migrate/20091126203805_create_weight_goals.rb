class CreateWeightGoals < ActiveRecord::Migration
  def self.up
    create_table :weight_goals do |t|
      t.datetime :goal
      t.decimal :weight, :precision => 6, :scale => 3
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :weight_goals
  end
end

