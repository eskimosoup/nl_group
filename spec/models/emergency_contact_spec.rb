require 'rails_helper'

RSpec.describe EmergencyContact, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:member_profile) }
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:email_address) }
    it { should validate_presence_of(:mobile_number) }
    it { should validate_presence_of(:relationship) }
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
