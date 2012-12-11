class CreateRotinas < ActiveRecord::Migration
  def change
    create_table :rotinas do |t|
      t.string :titulo

      t.timestamps
    end
  end
end
