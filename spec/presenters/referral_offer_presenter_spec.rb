require "rails_helper"

RSpec.describe ReferralOfferPresenter, type: :presenter do
  let(:referral_offer){ build(:referral_offer) }
  subject{ ReferralOfferPresenter.new(object: referral_offer, view_template: view) }

  it "#title" do
    expect(subject.title).to eq(referral_offer.title)
  end

  it "#details" do
    expect(subject.details).to eq(raw(referral_offer.details))
  end

  it "#terms_and_conditions" do
    expect(subject.terms_and_conditions).to eq(raw(referral_offer.terms_and_conditions))
  end
end
