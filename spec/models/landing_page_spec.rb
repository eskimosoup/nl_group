require 'rails_helper'

RSpec.describe LandingPage, type: :model do

  describe "validations", :validation do
    subject(:landing_page){ build(:landing_page) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message("is already taken, leave blank to generate automatically") }
  end

end
