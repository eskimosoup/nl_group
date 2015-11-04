FactoryGirl.define do
  factory :dbs_check do
    member_profile
    enhanced_dbs_completed_before false
    previous_disclosure_number "MyString"
    date_previous_dbs_completed "2015-11-04"
    company_completed_dbs_check "MyString"
    unprotected_convictions false
    unfiltered_convictions false
    another_country_police_check false
    suspended_or_under_investigation false
    additional_information "MyText"
  end

end
