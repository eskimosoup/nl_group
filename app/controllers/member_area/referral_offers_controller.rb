module MemberArea
  class ReferralOffersController < MemberArea::BaseController

    def index
      @referral_offers = ReferralOffer.displayed.order(created_at: :desc)
    end

    def show
      @referral_offer = ReferralOffer.displayed.find(params[:id])
      @referral = current_member_profile.referrals.new
    end
  end
end