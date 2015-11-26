class Timesheet < ActiveRecord::Base

  scope :for_member, ->(member_profile_id) { where(member_profile_id: member_profile_id) if member_profile_id.present? }

  belongs_to :member_profile
  delegate :full_name, to: :member_profile

  validates :member_profile, presence: true

  def time
    created_at.strftime("%-d %b %Y - %H:%M")
  end
end
