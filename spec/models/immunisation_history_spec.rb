require 'rails_helper'

RSpec.describe ImmunisationHistory, type: :model do
  describe "validations", :validation do
    describe "had triple vaccination" do
      subject { build(:immunisation_history, had_triple_vaccination: true) }
      it { should validate_presence_of(:triple_vaccination_date) }
    end

    describe "had polio vaccination" do
      subject { build(:immunisation_history, had_polio_vaccination: true) }
      it { should validate_presence_of(:polio_vaccination_date) }
    end

    describe "had hep b vaccination" do
      subject { build(:immunisation_history, had_hepatitis_b_vaccination: true) }
      it { should validate_presence_of(:hepatitis_b_vaccination_date) }
    end
  end

  describe "associations", :association do
    it { should belong_to(:member_profile) }
  end
end
