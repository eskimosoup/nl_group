module MessagesHelper
  def new_message_dismissal
    current_member_profile.message_dismissals.new
  end

  def message_classes(message_id, dismissed_message_ids)
    classes = ["admin-message"]
    classes << "unread" unless dismissed_message_ids.include?(message_id)
    classes.join(" ")
  end
end