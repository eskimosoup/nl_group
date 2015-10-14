class TeamMemberUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [250, 250]
  end

  version :show do
    process resize_to_fill: [500, 500]
  end

end