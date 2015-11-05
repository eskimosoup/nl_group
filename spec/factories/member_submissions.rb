FactoryGirl.define do
  factory :member_submission do
    member_profile
    health_information_accurate false
    full_acknowledgement false
    downloaded_handbook false
  end

end
