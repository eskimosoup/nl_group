module MemberArea
  class MemberProfilesController < MemberArea::BaseController
    def show
      @member_profile_presenter = current_member_profile
    end
  end
end