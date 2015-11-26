class Login < ActiveRecord::Base
  belongs_to :member_profile

  scope :for_member, ->(member_profile_id) { where(member_profile_id: member_profile_id) if member_profile_id.present? }

  delegate :full_name, to: :member_profile

  def time
    created_at.strftime("%-d %b %Y - %H:%M")
  end
end
