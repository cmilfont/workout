class Exercise < ActiveRecord::Base
  belongs_to :types_of_exercise
  belongs_to :sport
  belongs_to :user
  validates_presence_of :user
  validates_presence_of :sport
  validates_presence_of :types_of_exercise
  validates_presence_of :name
end

