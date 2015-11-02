require 'rails_helper'

RSpec.describe BasicMedicalHistory, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:gp_address) }
    it { should validate_presence_of(:member_profile) }

    describe "having treatment" do
      subject(:basic_medical_history){ build(:basic_medical_history, having_treatment: true) }

      it { should validate_presence_of(:treatment_clarification) }
    end

    describe "illness_affecting_work" do
      subject(:basic_medical_history){ build(:basic_medical_history, illness_affecting_work: true) }

      it { should validate_presence_of(:treatment_clarification) }
    end

    describe "illness_caused_by_work" do
      subject(:basic_medical_history){ build(:basic_medical_history, illness_caused_by_work: true) }

      it { should validate_presence_of(:treatment_clarification) }
    end

    describe "require_assistance" do
      subject(:basic_medical_history){ build(:basic_medical_history, require_assistance: true) }

      it { should validate_presence_of(:treatment_clarification) }
    end
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
