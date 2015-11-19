module MemberArea
  class SessionsController < MemberArea::BaseController

    def new

    end

    def create
      member_profile = MemberProfile.find_by(email: params[:email])
      if member_profile && member_profile.authenticate(params[:password])
        member_profile.logins.create
        if params[:remember_me]
          cookies.permanent[:auth_token] = member_profile.auth_token
        else
          cookies[:auth_token] = member_profile.auth_token
        end
        redirect_to member_area_member_profile_url, notice: "Logged In"
      else
        flash.now.alert = "Email or password is invalid"
        render :new
      end
    rescue BCrypt::Errors::InvalidHash => e
      logger.tagged("Member has not set password") do
        logger.info member_profile.email
      end

      flash.now.alert = "Email or password is invalid"
      render :new
    end

    def destroy
      cookies.delete(:auth_token)
      redirect_to member_area_login_url, notice: "Logged out!"
    end
  end
end
