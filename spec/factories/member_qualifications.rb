FactoryGirl.define do
  factory :member_qualification do
    member_profile
    register "A register"
    registration_number "1234567890"
    expiry_date { 2.weeks.from_now }
    afc_band 2
  end

end
