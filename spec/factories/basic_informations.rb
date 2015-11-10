FactoryGirl.define do
  factory :basic_information do
    member_profile
    title "Mr"
    first_name "MyString"
    middle_names "MyString"
    last_name "MyString"
    mobile_number "MyString"
    home_number "MyString"
    email_address "MyString"
    using_current_name_since { Date.today }
    changed_name false
    previous_names nil
    date_of_birth { Date.today }
    national_insurance_number "MyString"
    where_heard "MyString"
    referred_by nil
  end

end
