class Accreditation < ActiveRecord::Base
  mount_uploader :logo, AccreditationUploader
  validates :name, presence: true
end
