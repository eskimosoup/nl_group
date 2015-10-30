FactoryGirl.define do
  factory :member_other_training_course do
    member_training
    title "MyString"
    training_provider_name "MyString"
    completed_on { 3.years.ago }
  end

end
