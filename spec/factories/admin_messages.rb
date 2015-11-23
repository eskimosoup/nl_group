FactoryGirl.define do
  factory :admin_message do
    sequence(:title){|n| "Message #{ n }"}
    content "MyText"
    display true
  end

end
