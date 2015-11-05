class MemberSubmission < ActiveRecord::Base
  belongs_to :member_profile

  validates :downloaded_handbook, :full_acknowledgement, :health_information_accurate, acceptance: { :accept => true }
end
