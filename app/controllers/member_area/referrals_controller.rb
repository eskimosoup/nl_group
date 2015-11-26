module MemberArea
  class ReferralsController < MemberArea::BaseController
    before_action :set_referral_offer

    def create
      @referral = current_member_profile.referrals.new(referral_params.merge({ referral_offer_id: @referral_offer.id }))
      if @referral.save
        AdminMailer.referral_made(@referral).deliver_now
        redirect_to member_area_referral_offer_path(@referral_offer), notice: "Thank you for referring someone."
      else
        render "member_area/referral_offers/show"
      end
    end

    private

    def referral_params
      params.require(:referral).permit(:name, :email, :phone_number, :mobile_number)
    end

    def set_referral_offer
      @referral_offer = ReferralOffer.displayed.find(params[:referral_offer_id])
    end
  end
end