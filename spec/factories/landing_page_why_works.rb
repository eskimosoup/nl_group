FactoryGirl.define do
  factory :landing_page_why_work do
    title "MyString"
    reason_type { LandingPageWhyWork::REASON_TYPES.values.sample }
    content "MyString"
    display false
    position 1
  end

end
