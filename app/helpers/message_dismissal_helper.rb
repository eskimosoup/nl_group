module MessageDismissalHelper
  def new_message_dismissal
    current_member_profile.message_dismissals.new
  end
end