require 'rails_helper'

RSpec.describe Testimonial, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:content) }
  end
end
