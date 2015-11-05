FactoryGirl.define do
  factory :payment_information do
    member_profile
    payment_methodology { PaymentInformation::PAYMENT_METHODS.first }
    limit_working_week false
  end

end
