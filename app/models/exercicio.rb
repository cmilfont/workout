class Exercicio < ActiveRecord::Base
  attr_accessible :descricao, :titulo
  
  validates_presence_of :titulo, :descricao
  validates_uniqueness_of :titulo
  
  before_destroy :verificar_rotina
  
  private
  def verificar_rotina
    empty = Item.where(:exercicio_id => self.id).empty?
    msg = "Nao pode excluir esse exercicio porque ele participa de uma ou mais Rotinas"
    self.errors[:base] << msg unless empty
    empty
  end
  
end