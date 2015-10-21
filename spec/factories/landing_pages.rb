FactoryGirl.define do
  factory :landing_page do
    sequence(:name) {|n| "Name #{ n }" }
  end
end
