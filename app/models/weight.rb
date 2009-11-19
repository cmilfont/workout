class Weight < ActiveRecord::Base
  belongs_to :user
  validates_numericality_of :weight
end

