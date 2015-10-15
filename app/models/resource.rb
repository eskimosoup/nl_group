class Resource < ActiveRecord::Base

  mount_uploader :file, Optimadmin::DocumentUploader

  validates :name, :file, presence: true
end
