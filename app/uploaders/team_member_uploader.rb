class TeamMemberUploader < Optimadmin::ImageUploader

  version :index do
    process resize_to_fill: [96, 96]
  end

  version :show do
    process resize_to_fill: [250, 250]
  end

end
