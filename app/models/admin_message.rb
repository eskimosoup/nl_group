class AdminMessage < ActiveRecord::Base

  has_many :message_dismissals

  scope :displayed, ->{ where(display: true) }
  # Either no message dismissals, or no message dismissal belonging to the member
  scope :unread_by_member, ->(member_dismissed_ids){ where.not(id: member_dismissed_ids) }

  validates :title, :content, presence: true
end
