class AdminMessage < ActiveRecord::Base

  has_many :message_dismissals
  # Either no message dismissals, or no message dismissal belonging to the member
  scope :unread_by_member, ->(member){ includes(:message_dismissals).joins("LEFT JOIN message_dismissals on admin_messages.id = message_dismissals.admin_message_id")
                                           .where("message_dismissals.admin_message_id IS NULL OR message_dismissals.member_profile_id != ?", member.id) }

  validates :title, :content, presence: true
end
