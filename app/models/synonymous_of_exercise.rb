class SynonymousOfExercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise

  validates_presence_of :user
  validates_presence_of :exercise
  validates_presence_of :synonym

  validates_uniqueness_of :synonym, :scope => :exercise_id, :case_sensitive => false

end

