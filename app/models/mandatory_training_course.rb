class MandatoryTrainingCourse < ActiveRecord::Base

  scope :displayed, ->{ where(display: true) }
  validates :name, presence: true, uniqueness: true
end
