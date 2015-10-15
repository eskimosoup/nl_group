class TestimonialUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fill: [107, 107]
  end

end
