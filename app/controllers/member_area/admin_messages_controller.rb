module MemberArea
  class AdminMessagesController < MemberArea::BaseController
    def index
      @message_centre = MessageCentre.new(current_member_profile)
    end
  end
end