require 'rails_helper'

RSpec.describe TuberculosisChickenPoxCheck, type: :model do
  describe "validations", :validation do
    it { should validate_presence_of(:member_profile) }

    describe "had bcg vaccination" do
      subject { build(:tuberculosis_chicken_pox_check, bcg_vaccination: true) }
      it { should validate_presence_of(:vaccination_date) }
    end

    describe "had cough" do
      subject { build(:tuberculosis_chicken_pox_check, cough: true) }
      it { should validate_presence_of(:additional_information) }
    end

    describe "had weight_loss" do
      subject { build(:tuberculosis_chicken_pox_check, weight_loss: true) }
      it { should validate_presence_of(:additional_information) }
    end

    describe "had fever" do
      subject { build(:tuberculosis_chicken_pox_check, fever: true) }
      it { should validate_presence_of(:additional_information) }
    end

    describe "had tb" do
      subject { build(:tuberculosis_chicken_pox_check, had_tb: true) }
      it { should validate_presence_of(:additional_information) }
    end

    describe "had_chicken_pox" do
      subject { build(:tuberculosis_chicken_pox_check, had_chicken_pox: true) }
      it { should validate_presence_of(:chicken_pox_date) }
    end
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
