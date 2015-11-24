class JobApplication < ActiveRecord::Base
  belongs_to :member_profile
  belongs_to :job
end
