require "rails_helper"

RSpec.describe TuberculosisChickenPoxCheckPresenter, type: :presenter do
  let(:tuberculosis_chicken_pox_check) { create(:tuberculosis_chicken_pox_check) }
  subject(:tuberculosis_chicken_pox_check_presenter) { TuberculosisChickenPoxCheckPresenter.new(object: tuberculosis_chicken_pox_check,
                                                                                           view_template: view) }

  it "#edit link" do
    expect(subject.edit_link).to eq(link_to "Tuberculosis and Chicken Pox Information",
                                            edit_member_area_tuberculosis_chicken_pox_check_path, class: 'user-action-button')
  end

  describe "#lived continuously" do
    it "is true" do
      tuberculosis_chicken_pox_check.lived_continuously = true
      expect(subject.lived_continuously).to eq("Have lived continuously in the UK for the last 5 years")
    end

    it "is false" do
      tuberculosis_chicken_pox_check.lived_continuously = false
      expect(subject.lived_continuously).to eq("Have not lived continuously in the UK for the last 5 years")
    end
  end

  describe "#bcg vaccingation" do
    it "is true" do
      tuberculosis_chicken_pox_check.bcg_vaccination = true
      expect(subject.bcg_vaccination).to eq("Have had a BCG vaccination")
    end

    it "is false" do
      tuberculosis_chicken_pox_check.bcg_vaccination = false
      expect(subject.bcg_vaccination).to eq("Have not had a BCG vaccination")
    end
  end

  describe "#vaccination date" do
    it "is true" do
      tuberculosis_chicken_pox_check.bcg_vaccination = true
      expect(subject.vaccination_date).to eq(l(tuberculosis_chicken_pox_check.vaccination_date))
    end

    it "is false" do
      tuberculosis_chicken_pox_check.bcg_vaccination = false
      expect(subject.vaccination_date).to eq("Not applicable")
    end
  end

  describe "#cough" do
    it "is true" do
      tuberculosis_chicken_pox_check.cough = true
      expect(subject.cough).to eq("Yes")
    end

    it "is false" do
      tuberculosis_chicken_pox_check.cough = false
      expect(subject.cough).to eq("No")
    end
  end

  describe "#weight_loss" do
    it "is true" do
      tuberculosis_chicken_pox_check.weight_loss = true
      expect(subject.weight_loss).to eq("Yes")
    end

    it "is false" do
      tuberculosis_chicken_pox_check.weight_loss = false
      expect(subject.weight_loss).to eq("No")
    end
  end

  describe "#fever" do
    it "is true" do
      tuberculosis_chicken_pox_check.fever = true
      expect(subject.fever).to eq("Yes")
    end

    it "is false" do
      tuberculosis_chicken_pox_check.fever = false
      expect(subject.fever).to eq("No")
    end
  end

  describe "#fever" do
    it "is true" do
      tuberculosis_chicken_pox_check.had_tb = true
      expect(subject.had_tb).to eq("Yes")
    end

    it "is false" do
      tuberculosis_chicken_pox_check.had_tb = false
      expect(subject.had_tb).to eq("No")
    end
  end

  describe "#has_additional_information?" do
    it "is true" do
      allow(tuberculosis_chicken_pox_check).to receive(:needs_additional_information?).and_return(true)
      expect(subject.has_additional_information?).to be true
    end

    it "is false" do
      allow(tuberculosis_chicken_pox_check).to receive(:needs_additional_information?).and_return(false)
      expect(subject.has_additional_information?).to be false
    end
  end

  it "#additional_information" do
    expect(subject.additional_information).to eq(tuberculosis_chicken_pox_check.additional_information)
  end

  describe "had chicken_pox" do
    describe "is true" do
      let(:tuberculosis_chicken_pox_check) { create(:tuberculosis_chicken_pox_check, had_chicken_pox: true) }
      subject(:tuberculosis_chicken_pox_check_presenter) { TuberculosisChickenPoxCheckPresenter.new(object: tuberculosis_chicken_pox_check,
                                                                                                    view_template: view) }

      it "#had_chicken_pox?" do
        expect(subject.had_chicken_pox?).to be true
      end

      it "#had_chicken_pox" do
        expect(subject.had_chicken_pox).to eq("Yes - #{ l tuberculosis_chicken_pox_check.chicken_pox_date }")
      end
    end
    describe "is false" do
      let(:tuberculosis_chicken_pox_check) { create(:tuberculosis_chicken_pox_check, had_chicken_pox: false) }
      subject(:tuberculosis_chicken_pox_check_presenter) { TuberculosisChickenPoxCheckPresenter.new(object: tuberculosis_chicken_pox_check,
                                                                                                    view_template: view) }

      it "#had_chicken_pox?" do
        expect(subject.had_chicken_pox?).to be false
      end

      it "#had_chicken_pox" do
        expect(subject.had_chicken_pox).to eq("No")
      end
    end
  end
end
