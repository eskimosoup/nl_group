class MessageCentre
  attr_reader :messages, :dismissed_message_ids
  def initialize(member_profile)
    @member_profile = member_profile
    @dismissed_message_ids = member_profile.message_dismissals.pluck(:admin_message_id)
    @messages = AdminMessage.displayed.order(created_at: :desc)
  end
end