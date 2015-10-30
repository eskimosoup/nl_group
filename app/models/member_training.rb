class MemberTraining < ActiveRecord::Base
  belongs_to :member_profile
  has_many :member_mandatory_trainings
  has_many :mandatory_training_courses, through: :member_mandatory_trainings

  validates :member_profile, presence: true
end
