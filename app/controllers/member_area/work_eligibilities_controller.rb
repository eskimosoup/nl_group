module MemberArea
  class WorkEligibilitiesController < MemberArea::BaseController
    def new
      @work_eligibility = current_member_profile.build_work_eligibility
    end

    def create
      @work_eligibility = current_member_profile.build_work_eligibility(work_eligibility_params)
      if @work_eligibility.save
        redirect_to member_area_application_form_overview_url, notice: "Eligibility to work successfully saved"
      else
        render :new
      end
    end

    def edit
      @work_eligibility = current_member_profile.work_eligibility
    end

    def update
      @work_eligibility = current_member_profile.work_eligibility
      if @work_eligibility.update(work_eligibility_params)
        redirect_to member_area_application_form_overview_url, notice: "Eligibility to work successfully updated"
      else
        render :edit
      end
    end

    private

    def work_eligibility_params
      params.require(:work_eligibility).permit(:passport_number, :expiry_date, :nationality, :hold_eu_passport,
                                               :proof_of_right_to_work)
    end
  end
end