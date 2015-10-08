require 'rails_helper'

RSpec.describe Client, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:logo) }
    it { should allow_value("http://www.google.co.uk").for(:website) }
    it { should allow_value(nil).for(:website) }
    it { should_not allow_value("www.google.co.uk").for(:website) }
    it { should_not allow_value("google.co.uk").for(:website) }
  end
end
