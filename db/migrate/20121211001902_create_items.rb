class CreateItems < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.belongs_to :rotina
      t.belongs_to :exercicio
      t.integer :repeticao
      t.string :tempo

      t.timestamps
    end
    add_index :itens, :rotina_id
    add_index :itens, :exercicio_id
  end
end
