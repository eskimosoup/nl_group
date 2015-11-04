module MemberArea
  class TuberculosisChickenPoxChecksController < MemberArea::BaseController
    def new
      @tuberculosis_chicken_pox_check = current_member_profile.build_tuberculosis_chicken_pox_check
    end

    def create
      @tuberculosis_chicken_pox_check = current_member_profile.build_tuberculosis_chicken_pox_check(tuberculosis_chicken_pox_check_params)
      if @tuberculosis_chicken_pox_check.save
        redirect_to member_area_member_profile_url, notice: "Tuberculosis and chicken pox check saved"
      else
        render :new
      end
    end

    def edit
      @tuberculosis_chicken_pox_check = current_member_profile.tuberculosis_chicken_pox_check
    end

    def update
      @tuberculosis_chicken_pox_check = current_member_profile.tuberculosis_chicken_pox_check
      if @tuberculosis_chicken_pox_check.update(tuberculosis_chicken_pox_check_params)
        redirect_to member_area_member_profile_url, notice: "Tuberculosis and chicken pox check updated"
      else
        render :edit
      end
    end

    private

    def tuberculosis_chicken_pox_check_params
      params.require(:tuberculosis_chicken_pox_check).permit(:lived_continuously, :bcg_vaccination, :vaccination_date,
                     :cough, :weight_loss, :fever, :had_tb, :additional_information, :had_chicken_pox, :chicken_pox_date,
                     visited_countries_attributes: [:id, :name, :duration, :from_year, :to_year, :_destroy])
    end
  end
end
