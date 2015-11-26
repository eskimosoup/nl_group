require 'rails_helper'

RSpec.describe Referral, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:name) }

    describe "must have a contact method" do
      context "has no contact methods" do
        subject{ build(:referral, email: nil, phone_number: nil, mobile_number: nil) }

        it "is not valid" do
          subject.valid?
          expect(subject.errors[:contact_method]).to_not be_empty
        end
      end

      context "has an email" do
        subject{ build(:referral, email: "some email", phone_number: nil, mobile_number: nil) }

        it "is not valid" do
          subject.valid?
          expect(subject.errors[:contact_method]).to be_empty
        end
      end

      context "has a phone number" do
        subject{ build(:referral, email: nil, phone_number: "some phone number", mobile_number: nil) }

        it "is not valid" do
          subject.valid?
          expect(subject.errors[:contact_method]).to be_empty
        end
      end

      context "has a mobile number" do
        subject{ build(:referral, email: nil, phone_number: nil, mobile_number: "mobile number") }

        it "is not valid" do
          subject.valid?
          expect(subject.errors[:contact_method]).to be_empty
        end
      end
    end
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
    it { should belong_to(:referral_offer) }
  end
end
