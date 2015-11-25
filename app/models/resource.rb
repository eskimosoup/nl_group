class Resource < ActiveRecord::Base

  scope :displayed, ->{ where(display: true) }

  mount_uploader :file, Optimadmin::DocumentUploader

  validates :name, :file, presence: true
end
