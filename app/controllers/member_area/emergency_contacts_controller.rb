module MemberArea
  class EmergencyContactsController < MemberArea::BaseController
    def new
      @emergency_contact = current_member_profile.build_emergency_contact
    end

    def create
      @emergency_contact = current_member_profile.build_emergency_contact(emergency_contact_params)
      if @emergency_contact.save
        redirect_to member_area_referees_and_emergency_contact_path, notice: "Emergency contact was successfully saved"
      else
        render :new
      end
    end

    def edit
      @emergency_contact = current_member_profile.emergency_contact
    end

    def update
      @emergency_contact = current_member_profile.emergency_contact
      if @emergency_contact.update(emergency_contact_params)
        redirect_to member_area_referees_and_emergency_contact_path, notice: "Emergency contact was successfully updated"
      else
        render :edit
      end
    end

    private

    def emergency_contact_params
      params.require(:emergency_contact).permit(:full_name, :email_address, :mobile_number, :relationship)
    end
  end
end