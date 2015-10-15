FactoryGirl.define do
  factory :resource do
    name "MyString"
    file { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    display true
  end

end
