class Referee < ActiveRecord::Base
  belongs_to :member_profile

  validates :member_profile, :name, :position, :contact_number, :email_address, :postal_address, presence: true
end
