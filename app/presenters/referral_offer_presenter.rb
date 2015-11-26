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
end
