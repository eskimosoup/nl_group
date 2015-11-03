module MemberArea
  class BasicMedicalHistoriesController < MemberArea::BaseController
    def new
      @basic_medical_history = current_member_profile.build_basic_medical_history
    end

    def create
      @basic_medical_history = current_member_profile.build_basic_medical_history(basic_medical_history_params)
      if @basic_medical_history.save
        redirect_to member_area_occupational_health_screening_path, notice: "Basic medical history successfully saved"
      else
        render :edit
      end
    end

    def edit
      @basic_medical_history = current_member_profile.basic_medical_history
    end

    def update
      @basic_medical_history = current_member_profile.build_basic_medical_history
      if @basic_medical_history.update(basic_medical_history_params)
        redirect_to member_area_occupational_health_screening_path, notice: "Basic medical history successfully updated"
      else
        render :edit
      end
    end

    def basic_medical_history_params
      params.require(:basic_medical_history).permit(:gp_address, :illness_affecting_work, :illness_caused_by_work,
                                                    :require_assistance, :aving_treatment, :treatment_clarification)
    end
  end
end