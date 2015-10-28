FactoryGirl.define do
  factory :member_profile do
    sequence(:email){|n| "joe.bloggs#{ n }@example.com" }
    password "password"
    password_confirmation "password"
  end
end
