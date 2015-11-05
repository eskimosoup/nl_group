module MemberArea
  class PaymentInformationsController < MemberArea::BaseController
    def new
      @payment_information = current_member_profile.build_payment_information
    end

    def create
      @payment_information = current_member_profile.build_payment_information(payment_information_params)
      if @payment_information.save
        redirect_to member_area_member_profile_url, notice: "Payment information successfully saved"
      else
        render :new
      end
    end

    def edit
      @payment_information = current_member_profile.payment_information
    end

    def update
      @payment_information = current_member_profile.payment_information
      if @payment_information.update(payment_information_params)
        redirect_to member_area_member_profile_url, notice: "Payment information successfully updated"
      else
        render :edit
      end
    end

    private

    def payment_information_params
      params.require(:payment_information).permit(:payment_methodology, :limit_working_week, :downloaded_handbook)
    end
  end
end