class MessageDismissal < ActiveRecord::Base
  belongs_to :member_profile
  belongs_to :admin_message

  validates :member_profile, :admin_message, presence: true
end
