require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:role) }
  end
end
