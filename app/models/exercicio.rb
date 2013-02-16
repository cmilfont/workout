class Exercicio < ActiveRecord::Base
  attr_accessible :descricao, :titulo
  
  validates_presence_of :titulo, :descricao
  validates_uniqueness_of :titulo  
  
end