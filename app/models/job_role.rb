class JobRole < ActiveRecord::Base
  scope :displayed, -> { where(display: true) }

  validates :title, presence: true
end
