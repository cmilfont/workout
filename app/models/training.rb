class Training < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout

  validates_presence_of :exercise
  validates_presence_of :workout
  validates_presence_of :start
  validates_presence_of :finish

end

