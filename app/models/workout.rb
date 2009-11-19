class Workout < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user

  has_many :trainings

  accepts_nested_attributes_for :trainings, :allow_destroy => true

end

