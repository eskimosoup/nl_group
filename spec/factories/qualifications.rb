FactoryGirl.define do
  factory :qualification do
    member_qualification
    name "MyString"
    grade_obtained "MyString"
    completed_date { 3.years.ago }
  end

end
