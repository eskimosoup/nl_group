class EmergencyContact < ActiveRecord::Base
  belongs_to :member_profile

  validates :member_profile, :full_name, :mobile_number, :email_address, :relationship, presence: true
end
