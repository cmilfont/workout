class Sport < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :exercises
end

