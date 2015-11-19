module MemberArea
  class MemberSubmissionsController < MemberArea::BaseController
    def new
      @member_submission = current_member_profile.build_member_submission
    end

    def create
      @member_submission = current_member_profile.build_member_submission(member_submission_params)
      if @member_submission.save
        AdminMailer.registration_complete(current_member_profile).deliver_now
        redirect_to member_area_member_profile_path, notice: "Submission completed"
      else
        render :new
      end
    end

    private

    def member_submission_params
      params.require(:member_submission).permit(:downloaded_handbook, :full_acknowledgement, :health_information_accurate)
    end
  end
end