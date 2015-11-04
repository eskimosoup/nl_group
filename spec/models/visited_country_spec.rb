require 'rails_helper'

RSpec.describe VisitedCountry, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:from_year) }
    it { should validate_presence_of(:to_year) }
  end

  describe "associations", :association do
    it { should belong_to(:tuberculosis_chicken_pox_check) }
  end
end
