class MemberTraining < ActiveRecord::Base
  belongs_to :member_profile
  has_many :member_mandatory_trainings
  has_many :mandatory_training_courses, through: :member_mandatory_trainings
  has_many :member_other_training_courses
  accepts_nested_attributes_for :member_other_training_courses, allow_destroy: true

  validates :member_profile, presence: true
end
