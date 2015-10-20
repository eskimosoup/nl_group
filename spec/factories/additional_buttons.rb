FactoryGirl.define do
  factory :additional_button do
    additional_block
    button_text "MyString"
    button_link "MyString"
    display true
    trait :with_animation do
      after(:create) do |block|
        create(:additional_animation, additional_button: block)
      end
    end
    factory :additional_button_with_animation, traits: [:with_animation]
  end

end
