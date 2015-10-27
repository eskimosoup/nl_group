module MemberArea
  class BasicInformationsController < MemberArea::BaseController
    def new
      @basic_information = current_member_profile.build_basic_information
    end

    def create
      @basic_information = current_member_profile.build_basic_information(basic_information_params)
      if @basic_information.save
        redirect_to member_area_member_profile_url, notice: "Basic Information successfully saved"
      else
        render :new
      end
    end

    def edit
      @basic_information = current_member_profile.basic_information
    end

    def update
      @basic_information = current_member_profile.basic_information
      if @basic_information.update(basic_information_params)
        redirect_to member_area_member_profile_url, notice: "Basic Information successfully updated"
      else
        render :edit
      end
    end

    private

    def basic_information_params
      params.require(:basic_information).permit(:title, :first_name, :middle_names, :last_name, :mobile_number,
      :home_number, :email_address, :using_current_name_since, :changed_name, :previous_names, :date_of_birth,
      :national_insurance_number, :where_heard, :referred_by)

    end
  end
end