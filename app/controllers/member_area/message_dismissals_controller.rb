module MemberArea
  class MessageDismissalsController < MemberArea::BaseController
    def create
      @message_dismissal = current_member_profile.message_dismissals.create(message_dismissal_params)
      respond_to do |format|
        format.html do
          redirect_to member_area_member_profile_path, notice: "Message dismissed"
        end
        format.js do

        end
      end
    end

    private

    def message_dismissal_params
      params.require(:message_dismissal).permit(:admin_message_id)
    end
  end
end