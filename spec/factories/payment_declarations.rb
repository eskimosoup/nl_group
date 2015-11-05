FactoryGirl.define do
  factory :payment_declaration do
    member_profile
    payment_methodology { PaymentDeclaration::PAYMENT_METHODS.first }
    limit_working_week false
  end

end
