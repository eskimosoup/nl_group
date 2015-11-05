module MemberArea
  class PaymentDeclarationsController < MemberArea::BaseController
    def new
      @payment_declaration = current_member_profile.build_payment_declaration
    end

    def create
      @payment_declaration = current_member_profile.build_payment_declaration(payment_declaration_params)
      if @payment_declaration.save
        redirect_to member_area_member_profile_url, notice: "Payment declaration successfully saved"
      else
        render :new
      end
    end

    def edit
      @payment_declaration = current_member_profile.payment_declaration
    end

    def update
      @payment_declaration = current_member_profile.payment_declaration
      if @payment_declaration.update(payment_declaration_params)
        redirect_to member_area_member_profile_url, notice: "Payment declaration successfully updated"
      else
        render :edit
      end
    end

    private

    def payment_declaration_params
      params.require(:payment_declaration).permit(:payment_methodology, :limit_working_week, :downloaded_handbook)
    end
  end
end