FactoryGirl.define do
  factory :additional_block do
    additional_row
    position "MyString"
    name "MyString"
    classes "MyString"
    display false
    after(:create) do |block|
      create(:additional_paragraph, additional_block: block)
      create(:additional_title, additional_block: block)
    end

    trait :with_animation do
      after(:create) do |block|
        create(:additional_paragraph, additional_block: block)
        create(:additional_title, additional_block: block)
        FactoryGirl.create_list(:additional_button_with_animation, 2, additional_block: block)
        create(:additional_animation, additional_block: block)
      end
    end
    factory :additional_block_with_animation, traits: [:with_animation]
  end
end
