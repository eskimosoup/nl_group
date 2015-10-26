module MemberArea
  class PasswordResetsController < MemberArea::BaseController
    def new

    end

    def create
      member_profile = MemberProfile.find_by(email: params[:email])
      ResetMemberProfilePassword.new(member_profile).call
      redirect_to member_area_login_url, notice: "Email sent with password reset instructions"
    end
  end
end