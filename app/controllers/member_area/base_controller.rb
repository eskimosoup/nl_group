module MemberArea
  class BaseController < ApplicationController

    layout 'member_area'

    def index

    end


    private
    def current_member_profile
      @current_member_profile ||= MemberProfile.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
    end
    helper_method :current_member_profile

    def presented_current_member_profile
      @presented_current_member_profile ||= MemberProfilePresenter.new(object: current_member_profile,
                                                         view_template: view_context) if current_member_profile.present?
    end
    helper_method :presented_current_member_profile

  end
end