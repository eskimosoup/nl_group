class MemberMandatoryTraining < ActiveRecord::Base
  belongs_to :member_training
  belongs_to :mandatory_training_course
end
