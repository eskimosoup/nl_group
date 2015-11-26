module Optimadmin
  class ReferralOfferPresenter < Optimadmin::BasePresenter
    presents :referral_offer
    delegate :id, to: :referral_offer

    def title
      referral_offer.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw referral_offer.details
    end
  end
end
