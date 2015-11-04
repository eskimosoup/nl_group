FactoryGirl.define do
  factory :tuberculosis_chicken_pox_check do
    member_profile
    lived_continuously false
    bcg_vaccination false
    vaccination_date "2015-11-03"
    cough false
    weight_loss false
    fever false
    had_tb false
    additional_information false
    had_chicken_pox false
    chicken_pox_date "2015-11-03"
  end

end
