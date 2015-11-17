class Job < ActiveRecord::Base

  scope :published, ->{ where(state: "published") }
  has_one :job_location
  accepts_nested_attributes_for :job_location, update_only: true
end
