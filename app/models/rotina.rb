class Rotina < ActiveRecord::Base
  attr_accessible :titulo
  has_many :itens
  validates_presence_of :titulo
end
