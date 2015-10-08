FactoryGirl.define do
  factory :client do
    name "Client Name"
    logo { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }

    trait :with_website do
      website "http://www.google.co.uk"
    end

    factory :client_with_website, traits: [:with_website]
  end

end
