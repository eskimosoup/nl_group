FactoryGirl.define do
  factory :basic_medical_history do
    member_profile nil
gp_address "MyText"
illness_affecting_work false
illness_caused_by_work false
require_assistance false
having_treatment false
treatment_clarification "MyText"
  end

end
