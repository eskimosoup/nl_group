FactoryGirl.define do
  factory :referee do
    member_profile
    name "Jane Doe"
    position "Position"
    contact_number "01234 567890"
    fax_number "01234 567890"
    email_address "example@example.com"
    postal_address "MyString"
    contact_referee true
  end

end
