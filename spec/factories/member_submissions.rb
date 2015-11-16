FactoryGirl.define do
  factory :member_submission do
    member_profile
    health_information_accurate true
    full_acknowledgement true
    downloaded_handbook true
  end

end
