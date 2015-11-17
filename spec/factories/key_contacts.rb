FactoryGirl.define do
  factory :key_contact do
    name "MyString"
    sequence(:email) {|n| "email#{ n }@example.com" }
    phone_number "MyString"
    mobile_number "MyString"
  end

end
