require 'rails_helper'

RSpec.describe FrequentlyAskedQuestion, type: :model do

  subject(:faq) { build(:frequently_asked_question) }

  describe "validations", :validation do
    it { should validate_presence_of(:question) }
    it { should validate_uniqueness_of(:question) }
    it { should validate_presence_of(:answer) }
  end

  describe "associations", :association do
    it { should have_many(:landing_page_faqs) }
    it { should have_many(:landing_pages).through(:landing_page_faqs) }
  end
end
