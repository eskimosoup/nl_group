FactoryGirl.define do
  factory :emergency_contact do
    member_profile
    full_name "Jane Doe"
    sequence(:email_address){|n| "some.name#{ n }@example.com"}
    mobile_number "01234 567 890"
    relationship "Relationship"
  end

end
