class CreateWeights < ActiveRecord::Migration
  def self.up
    create_table :weights do |t|
      t.belongs_to :user
      t.decimal :weight, :precision => 6, :scale => 3

      t.timestamps
    end
  end

  def self.down
    drop_table :weights
  end
end

