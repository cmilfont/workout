class Item < ActiveRecord::Base
  belongs_to :rotina
  belongs_to :exercicio
  attr_accessible :repeticao, :tempo, :rotina_id, :exercicio_id, :exercicio
  
  validates_presence_of :rotina, :exercicio
  
end