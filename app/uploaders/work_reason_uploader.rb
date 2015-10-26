# Reason to work icon uploader
class WorkReasonUploader < Optimadmin::ImageUploader
  version :show do
    process resize_to_fit: [40, 40]
  end
end
