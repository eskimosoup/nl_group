class Timesheet < ActiveRecord::Base
  belongs_to :member_profile

  validates :member_profile, presence: true
end
