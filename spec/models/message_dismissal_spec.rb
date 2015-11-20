require 'rails_helper'

RSpec.describe MessageDismissal, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:member_profile) }
    it { should validate_presence_of(:admin_message) }
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
    it { should belong_to(:admin_message) }
  end

end
