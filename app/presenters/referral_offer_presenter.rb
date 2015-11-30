class ReferralOfferPresenter < BasePresenter
  presents :referral_offer

  def title
    referral_offer.title
  end

  def details
    h.raw referral_offer.details
  end

  def terms_and_conditions
    h.raw referral_offer.terms_and_conditions
  end

  def show_link
    h.link_to "View Offer", h.member_area_referral_offer_path(referral_offer), class: 'dark-action-button'
  end
end
