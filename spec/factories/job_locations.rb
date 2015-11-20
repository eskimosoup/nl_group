FactoryGirl.define do
  factory :job_location do
    job
    country "MyString"
    country_code "MyString"
    region "MyString"
    region_code "MyString"
    city "MyString"
    zip_code "MyString"
    telecommuting false
  end

end
