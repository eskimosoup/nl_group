require 'rails_helper'

RSpec.describe BasicInformation, type: :model do

  describe "validations", :validation do
    subject(:basic_information){ build(:basic_information) }
    it { should validate_presence_of(:member_profile) }
    it { should validate_presence_of(:title) }
    it { should validate_inclusion_of(:title).in_array(%w( Mr Mrs Miss Ms Dr Prof ))}
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:mobile_number) }
    it { should validate_presence_of(:email_address) }
    it { should validate_uniqueness_of(:email_address) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_presence_of(:where_heard) }
    it { should validate_exclusion_of(:where_heard).in_array(%w( other )).with_message("You need to specify how you heard about us") }
    it { should validate_presence_of(:national_insurance_number) }

    describe "referral validation" do
      subject(:basic_information){ build(:basic_information, where_heard: "referral") }

      it "should invalid if where heard is referral and referred by is not set" do
        expect(basic_information.valid?).to be false
      end

      it "should be valid once referred by is set" do
        basic_information.referred_by = "Joe"
        expect(basic_information.valid?).to be true
      end

      it { should validate_presence_of(:referred_by).with_message("Please specify who referred you") }
    end

    describe "previous name validation" do
      subject(:basic_information){ build(:basic_information, changed_name: true) }

      it "should be invalid without previous names set" do
        expect(basic_information.valid?).to be false
      end

      it "should be valid once previous names are set" do
        basic_information.previous_names = "Joe Bloggs"
        expect(basic_information.valid?).to be true
      end

      it { should validate_presence_of(:previous_names)}
    end

  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end

  describe "suggesting other where heard" do
    subject(:basic_information){ build(:basic_information, where_heard: "other") }

    it "updates where heard with the suggestion" do
      basic_information.member_where_heard = "Google"
      expect(basic_information.valid?).to be true
      expect(basic_information.where_heard).to eq("Google")
    end

    it "is invalid without a suggestion" do
      expect(basic_information.valid?).to be false
    end

    it { should validate_presence_of(:member_where_heard).with_message("You must specify where you heard") }
  end
end
