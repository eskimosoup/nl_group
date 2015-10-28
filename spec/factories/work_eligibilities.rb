FactoryGirl.define do
  factory :work_eligibility do
    member_profile
    passport_number "MyString"
    expiry_date { Date.today + 2.weeks }
    nationality "MyString"
    hold_eu_passport true
    proof_of_right_to_work "MyString"
  end

end
