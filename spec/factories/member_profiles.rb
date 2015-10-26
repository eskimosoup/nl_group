FactoryGirl.define do
  factory :member_profile do
    email "joe.bloggs@example.com"
    password "password"
    password_confirmation "password"
  end
end
