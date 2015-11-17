module MemberArea
  class MemberProfilesController < MemberArea::BaseController
    def show
      @dashboard = Dashboard.new(current_member_profile)
    end

    def edit
      @member_profile = current_member_profile
    end

    def update
      @member_profile = current_member_profile
      if @member_profile.update(member_profile_params)
        redirect_to member_area_member_profile_url, notice: "Successfully updated member profile"
      else
        render :edit
      end
    end

    private

    def member_profile_params
      params.require(:member_profile).permit(:password, :password_confirmation)
    end
  end
end