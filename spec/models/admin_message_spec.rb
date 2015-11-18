require 'rails_helper'

RSpec.describe AdminMessage, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end
end
