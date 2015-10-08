class ClientUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fill: [250, 250]
  end

end
