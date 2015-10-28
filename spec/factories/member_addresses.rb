FactoryGirl.define do
  factory :member_address do
    member_profile
    address "MyString"
    lived_here_from { 3.years.ago }
    lived_here_to { Date.today }
    current false
  end

end
