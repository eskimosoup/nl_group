require 'rails_helper'

RSpec.describe LandingPageTestimonial, type: :model do
  describe "associations", :association do
    it { should belong_to(:landing_page) }
    it { should belong_to(:testimonial) }
  end
end
