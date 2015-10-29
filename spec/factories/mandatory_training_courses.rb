FactoryGirl.define do
  factory :mandatory_training_course do
    sequence(:name){|n| "Course #{ n }" }
    display true
  end

end
