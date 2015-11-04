module MemberArea
  class ImmunisationHistoriesController < BaseController
    def new
      @immunisation_history = current_member_profile.build_immunisation_history
    end

    def create
      @immunisation_history = current_member_profile.build_immunisation_history(immunisation_history_params)
      if @immunisation_history.save
        redirect_to member_area_occupational_health_screening_url, notice: "Immunisation history was successfully saved"
      else
        render :new
      end
    end

    def edit
      @immunisation_history = current_member_profile.immunisation_history
    end

    def update
      @immunisation_history = current_member_profile.immunisation_history
      if @immunisation_history.update(immunisation_history_params)
        redirect_to member_area_occupational_health_screening_url, notice: "Immunisation history was successfully updated"
      else
        render :edit
      end
    end

    private

    def immunisation_history_params
      params.require(:immunisation_history).permit(:had_triple_vaccination, :triple_vaccination_date, :had_polio_vaccination,
           :polio_vaccination_date, :had_hepatitis_b_vaccination, :hepatitis_b_vaccination_date, :hep_b_course_1_date,
           :hep_b_course_2_date, :hep_b_course_3_date, :hep_b_booster_1_date, :hep_b_booster_2_date, :hep_b_booster_3_date,
           :role_involves_epps)
    end
  end
end