class AddHeightToUser < ActiveRecord::Migration

  def self.up
    add_column :users, :height, :decimal, :precision => 3, :scale => 0
  end

  def self.down
    remove_column :users, :height
  end

end

