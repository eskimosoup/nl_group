require 'rails_helper'

RSpec.describe LandingPage, type: :model do

  describe "validations", :validation do
    subject(:landing_page){ build(:landing_page) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message("is already taken, leave blank to generate automatically") }
  end

  describe "associations", :association do
    it { should have_many(:landing_page_contents) }
    it { should have_many(:why_work_reasons) }
    it { should have_many(:landing_page_why_works).through(:why_work_reasons) }
    it { should have_many(:landing_page_testimonials) }
    it { should have_many(:testimonials).through(:landing_page_testimonials) }
    it { should have_many(:landing_page_faqs) }
    it { should have_many(:frequently_asked_questions).through(:landing_page_faqs) }
  end

end
