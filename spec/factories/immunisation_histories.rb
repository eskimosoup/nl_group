FactoryGirl.define do
  factory :immunisation_history do
    had_triple_vaccination false
    triple_vaccination_date "2015-11-04"
    had_polio_vaccination false
    polio_vaccination_date "2015-11-04"
    had_hepatitis_b_vaccination false
    hepatitis_b_vaccination_date "2015-11-04"
    hep_b_course_1_date "2015-11-04"
    hep_b_course_2_date "2015-11-04"
    hep_b_course_3_date "2015-11-04"
    hep_b_booster_1_date "2015-11-04"
    hep_b_booster_2_date "2015-11-04"
    hep_b_booster_3_date "2015-11-04"
    role_involves_epps false
  end

end
