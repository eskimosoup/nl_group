class LandingPageFaq < ActiveRecord::Base
  belongs_to :landing_page
  belongs_to :frequently_asked_question
end
