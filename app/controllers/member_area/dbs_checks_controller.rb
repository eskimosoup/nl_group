module MemberArea
  class DbsChecksController < MemberArea::BaseController
    def new
      @dbs_check = current_member_profile.build_dbs_check
    end

    def create
      @dbs_check = current_member_profile.build_dbs_check(dbs_check_params)
      if @dbs_check.save
        redirect_to member_area_member_profile_url, notice: "DBS Check successfully saved"
      else
        render :new
      end
    end

    def edit
      @dbs_check = current_member_profile.dbs_check
    end

    def update
      @dbs_check = current_member_profile.dbs_check
      if @dbs_check.update(dbs_check_params)
        redirect_to member_area_member_profile_url, notice: "DBS Check successfully updated"
      else
        render :edit
      end
    end

    private

    def dbs_check_params
      params.require(:dbs_check).permit(:enhanced_dbs_completed_before, :previous_disclosure_number, :date_previous_dbs_completed,
          :company_completed_dbs_check, :unprotected_convictions, :unfiltered_convictions, :another_country_police_check,
                                        :suspended_or_under_investigation, :additional_information)
    end
  end
end