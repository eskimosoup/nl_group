module MemberArea
  class PasswordResetsController < MemberArea::BaseController
    def new

    end

    def create
      member_profile = MemberProfile.find_by(email: params[:email])
      ResetMemberProfilePassword.new(member_profile).call
      redirect_to member_area_login_url, notice: "Email sent with password reset instructions"
    end

    def edit
      @member_profile = MemberProfile.find_by!(password_reset_token: params[:id])
    end

    def update
      @member_profile = MemberProfile.find_by!(password_reset_token: params[:id])
      if @member_profile.password_reset_sent_at < 2.hours.ago
        redirect_to new_member_area_password_reset_path, alert: "Password reset has expired."
      elsif @member_profile.update(member_profile_params)
        cookies.permanent[:auth_token] = @member_profile.auth_token
        redirect_to member_area_member_profile_url, notice: "Password has been reset."
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