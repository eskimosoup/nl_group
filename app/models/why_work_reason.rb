class WhyWorkReason < ActiveRecord::Base
  belongs_to :landing_page
  belongs_to :landing_page_why_work
end
