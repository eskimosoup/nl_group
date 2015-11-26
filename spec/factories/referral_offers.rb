FactoryGirl.define do
  factory :referral_offer do
    sequence(:title) { |n| "Referral Offer #{ n }" }
    details "MyText"
    terms_and_conditions "MyText"
    display true
  end

end
