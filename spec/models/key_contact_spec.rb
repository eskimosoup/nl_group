require 'rails_helper'

RSpec.describe KeyContact, type: :model do
  subject(:key_contact) { build(:key_contact) }
  describe "validations", :validation do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }

    describe "needs a communication method" do
      subject(:key_contact) { build(:key_contact, email: nil, phone_number: nil, mobile_number: nil) }

      it "should not allow not communication method" do
        key_contact.valid?
        expect(key_contact.errors[:communication_method]).to include("must be present")
      end

      it "is valid if has an email" do
        key_contact.email = "example@example.com"
        key_contact.valid?
        expect(key_contact.errors[:communication_method]).to be_empty
      end

      it "is valid if has an phone number" do
        key_contact.phone_number = "42"
        key_contact.valid?
        expect(key_contact.errors[:communication_method]).to be_empty
      end

      it "is valid if has an mobile number" do
        key_contact.mobile_number = "42"
        key_contact.valid?
        expect(key_contact.errors[:communication_method]).to be_empty
      end
    end
  end

end
