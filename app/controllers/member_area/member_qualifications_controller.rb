module MemberArea
  class MemberQualificationsController < MemberArea::BaseController
    def new
      @member_qualification = current_member_profile.build_member_qualification
    end

    def create
      @member_qualification = current_member_profile.build_member_qualification(member_qualification_params)
      if @member_qualification.save
        redirect_to member_area_member_profile_url, notice: "Qualifications were successfully saved"
      else
        render :new
      end
    end

    def edit
      @member_qualification = current_member_profile.member_qualification
    end

    def update
      @member_qualification = current_member_profile.member_qualification
      if @member_qualification.update(member_qualification_params)
        redirect_to member_area_member_profile_url, notice: "Qualifications were successfully updated"
      else
        render :edit
      end
    end

    private

    def member_qualification_params
      params.require(:member_qualification).permit(:register, :registration_number, :expiry_date, :afc_band)
    end
  end
end