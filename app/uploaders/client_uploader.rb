class ClientUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fill: [132, 132]
  end

end
