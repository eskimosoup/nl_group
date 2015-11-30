class LandingPageTestimonial < ActiveRecord::Base
  belongs_to :landing_page
  belongs_to :testimonial
end
