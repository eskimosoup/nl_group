require 'rails_helper'

RSpec.describe Testimonial, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:content) }
  end

  describe "associations", :association do
    it { should have_many(:landing_page_testimonials) }
    it { should have_many(:landing_pages).through(:landing_page_testimonials) }
  end
end
