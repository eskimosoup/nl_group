module MemberArea
  class BasicInformationsController < MemberArea::BaseController
    def new
      @basic_information = current_member_profile.build_basic_information
    end

    def edit
      @basic_information = current_member_profile.basic_information
    end
  end
end