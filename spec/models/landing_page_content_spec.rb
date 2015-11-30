require 'rails_helper'

RSpec.describe LandingPageContent, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:landing_page) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:area) }
    it { should validate_inclusion_of(:area).in_array(LandingPageContent::AREAS.values) }
  end

  describe "associations", :association do
    it { should delegate_method(:name).to(:landing_page).with_prefix }
    it { should belong_to(:landing_page) }
  end
end
