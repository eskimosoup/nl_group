class MemberOtherTrainingCourse < ActiveRecord::Base
  belongs_to :member_training

  validates :title, :training_provider_name, :completed_on, presence: true
end
