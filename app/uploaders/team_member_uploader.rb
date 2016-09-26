class TeamMemberUploader < Optimadmin::ImageUploader
  version :small do
    process resize_to_fill: [96, 96]
  end

  version :index do
    process resize_to_fill: [169, 169]
  end

  version :modal do
    process resize_to_fill: [109, 109]
  end

  version :show do
    process resize_to_fill: [364, 364]
  end
end
