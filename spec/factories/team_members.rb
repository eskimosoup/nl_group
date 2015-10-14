FactoryGirl.define do
  factory :team_member do
    forename "Joe"
    surname "Bloggs"

    profile "Some profile about something"
    email "joe.bloggs@example.com"
    phone "01234 567890"
    role "Supreme Ruler"
    display true

    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end

    factory :team_member_with_image, traits: [:with_image]
  end

end
