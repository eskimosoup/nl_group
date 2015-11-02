module MemberArea
  class RefereesController < MemberArea::BaseController
    def new
      @referee = current_member_profile.referees.new
    end

    def create
      @referee = current_member_profile.referees.new(referee_params)
      if @referee.save
        redirect_to member_area_referees_and_emergency_contact_path, notice: "Referee successfully saved"
      else
        render :new
      end
    end

    def edit
      @referee = current_member_profile.referees.find(params[:id])
    end

    def update
      @referee = current_member_profile.referees.find(params[:id])
      if @referee.update(referee_params)
        redirect_to member_area_referees_and_emergency_contact_path, notice: "Referee successfully updated"
      else
        render :edit
      end
    end

    private

    def referee_params
      params.require(:referee).permit(:name, :position, :contact_number, :fax_number, :email_address, :postal_address,
                                      :contact_referee)
    end

  end
end