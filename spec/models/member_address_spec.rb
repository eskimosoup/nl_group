require 'rails_helper'

RSpec.describe MemberAddress, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:member_profile) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:lived_here_from) }
    it { should validate_presence_of(:lived_here_to).with_message("can't be blank unless this is your current address") }

    describe "current address" do
      subject(:member_address){ build(:member_address, current: true) }
      it { should_not validate_presence_of(:lived_here_to) }
    end

    describe "current address" do
      subject(:member_address){ create(:member_address, current: true) }
      it { should validate_uniqueness_of(:current).scoped_to(:member_profile_id) }
    end
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
