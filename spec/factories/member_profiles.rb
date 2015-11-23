FactoryGirl.define do
  factory :member_profile do
    team_member
    sequence(:email){|n| "joe.bloggs#{ n }@example.com" }
    password "password"
    password_confirmation "password"
    first_name "First Name"
    last_name "Last Name"
    full_name { [first_name, last_name].compact.join(" ") }

    factory :expired_password_reset_member_profile do
      password_reset_token { SecureRandom.urlsafe_base64 }
      password_reset_sent_at { Time.zone.now - 3.hours }
    end
  end

  factory :member_profile_no_password, class: MemberProfile do
    sequence(:email){|n| "joe.bloggs#{ n }@example.com" }
  end
end
