module MemberArea
  class SetPasswordsController < MemberArea::BaseController

    before_action :set_member_profile

    def edit
    end

    def update
      if @member_profile.update(member_profile_params)
        cookies[:auth_token] = @member_profile.auth_token
        redirect_to member_area_member_profile_url, notice: "Password has been set."
      else
        render :edit
      end
    end

    private

    def set_member_profile
      @member_profile = MemberProfile.find_by!(password_set_token: params[:id])
      redirect_to member_area_login_url,
                  notice: "Password already set, please login or request a reset" if @member_profile.password_digest.present?
    end

    def member_profile_params
      params.require(:member_profile).permit(:password, :password_confirmation)
    end
  end
end