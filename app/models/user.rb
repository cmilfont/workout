class User < ActiveRecord::Base

  acts_as_authentic

  has_many :workouts
  has_many :weights
  has_many :weight_goals

  validates_presence_of :login
  validates_presence_of :email
  validates_numericality_of :height

  def last_weight
    @weight = Weight.last(:conditions => {:user_id => self.id})
  end

  def last_weight_goal
    @weight_goal = WeightGoal.last(:conditions => {:user_id => self.id})
  end

  def active?
    true
  end

end

