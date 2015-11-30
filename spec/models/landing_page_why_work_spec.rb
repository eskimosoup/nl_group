require 'rails_helper'

RSpec.describe LandingPageWhyWork, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:reason_type) }
    it { should validate_inclusion_of(:reason_type).in_array(LandingPageWhyWork::REASON_TYPES.values) }
    it { should validate_presence_of(:content) }
  end

  describe "associations", :association do
    it { should have_many(:why_work_reasons) }
    it { should have_many(:landing_pages).through(:why_work_reasons) }
  end
end
