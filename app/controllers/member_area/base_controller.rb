module MemberArea
  class BaseController < ApplicationController

    layout 'member_area'

    def index

    end


    private
    def current_member_profile
      if cookies[:auth_token]
        @current_member_profile ||= begin
          member_profile = MemberProfile.find_by(auth_token: cookies[:auth_token])
          MemberProfilePresenter.new(object: member_profile, view_template: view_context) if member_profile.present?
        end
      end
    end
    helper_method :current_member_profile

  end
end