class AccreditationUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fill: [156, 156]
  end
end
