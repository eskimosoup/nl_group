FactoryGirl.define do
  factory :testimonial do
    forename "Jane"
    surname "Doe"
    role "Nurse"

    content "<p>Content</p>"
    video_embed_code nil
    display true

    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end

    factory :testimonial_with_image, traits: [:with_image]
  end

end
