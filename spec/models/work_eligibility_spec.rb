require 'rails_helper'

RSpec.describe WorkEligibility, type: :model do

  describe "validations", :validation do
    it { should validate_presence_of(:passport_number) }
    it { should validate_presence_of(:expiry_date) }
    it { should validate_presence_of(:member_profile) }

    describe "does not hold an eu passport" do
      subject(:work_eligibility){ build(:work_eligibility, hold_eu_passport: false) }
      it { should validate_presence_of(:proof_of_right_to_work) }
    end

    describe "expiry date must be in future" do
      it "should not be valid if date is today or sooner" do
        work_eligibility = build(:work_eligibility)
        work_eligibility.valid?
        expect(work_eligibility.errors[:expiry_date]).to include("must be in the future")
      end

      it "should be valid if date is in future" do
        work_eligibility = build(:work_eligibility, expiry_date: (Date.today + 2.weeks))
        expect(work_eligibility.valid?).to be true
      end
    end
  end


end
