class AccreditationUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fit: [9999, 80]
  end
end
