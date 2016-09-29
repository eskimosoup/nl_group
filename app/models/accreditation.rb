class Accreditation < ActiveRecord::Base
  mount_uploader :logo, AccreditationUploader

  validates :name, presence: true

  default_scope { positioned }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
