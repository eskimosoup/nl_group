require "rails_helper"

RSpec.describe ImmunisationHistoryPresenter, type: :presenter do
  let(:immunisation_history){ create(:immunisation_history) }
  subject(:immunisation_history_presenter){ ImmunisationHistoryPresenter.new(object: immunisation_history, view_template: view) }

  it "#edit_link" do
    expect(immunisation_history_presenter.edit_link).to eq(link_to("Edit Immunisation History", edit_member_area_immunisation_history_path, class: 'user-action-button'))
  end

  describe "triple vaccination date" do
    let(:immunisation_history){ create(:immunisation_history) }
    subject(:immunisation_history_presenter){ ImmunisationHistoryPresenter.new(object: immunisation_history, view_template: view) }

    it "has a vaccination date" do
      immunisation_history.had_triple_vaccination = true
      expect(subject.triple_vaccination_date).to eq(l(immunisation_history.triple_vaccination_date))
    end

    it "has no vaccination date" do
      immunisation_history.had_triple_vaccination = false
      expect(subject.triple_vaccination_date).to eq("Not applicable")
    end
  end

  describe "polio vaccination date" do
    let(:immunisation_history){ create(:immunisation_history) }
    subject(:immunisation_history_presenter){ ImmunisationHistoryPresenter.new(object: immunisation_history, view_template: view) }

    it "has a vaccination date" do
      immunisation_history.had_polio_vaccination = true
      expect(subject.polio_vaccination_date).to eq(l(immunisation_history.polio_vaccination_date))
    end

    it "has no vaccination date" do
      immunisation_history.had_polio_vaccination = false
      expect(subject.polio_vaccination_date).to eq("Not applicable")
    end
  end

  describe "hepatitis_b vaccination date" do
    let(:immunisation_history){ create(:immunisation_history) }
    subject(:immunisation_history_presenter){ ImmunisationHistoryPresenter.new(object: immunisation_history, view_template: view) }

    it "has a vaccination date" do
      immunisation_history.had_hepatitis_b_vaccination = true
      expect(subject.hepatitis_b_vaccination_date).to eq(l(immunisation_history.hepatitis_b_vaccination_date))
    end

    it "has no vaccination date" do
      immunisation_history.had_hepatitis_b_vaccination = false
      expect(subject.hepatitis_b_vaccination_date).to eq("Not applicable")
    end
  end

  describe "#hep_b_course_1_date" do
    it "is present" do
      immunisation_history.hep_b_course_1_date = Date.today
      expect(subject.hep_b_course_1_date).to eq(l(immunisation_history.hep_b_course_1_date))
    end

    it "is blank" do
      immunisation_history.hep_b_course_1_date = nil
      expect(subject.hep_b_course_1_date).to eq("Not applicable")
    end
  end

  describe "#hep_b_course_2_date" do
    it "is present" do
      immunisation_history.hep_b_course_2_date = Date.today
      expect(subject.hep_b_course_2_date).to eq(l(immunisation_history.hep_b_course_2_date))
    end

    it "is blank" do
      immunisation_history.hep_b_course_2_date = nil
      expect(subject.hep_b_course_2_date).to eq("Not applicable")
    end
  end

  describe "#hep_b_course_3_date" do
    it "is present" do
      immunisation_history.hep_b_course_3_date = Date.today
      expect(subject.hep_b_course_3_date).to eq(l(immunisation_history.hep_b_course_3_date))
    end

    it "is blank" do
      immunisation_history.hep_b_course_3_date = nil
      expect(subject.hep_b_course_3_date).to eq("Not applicable")
    end
  end

  describe "#hep_b_booster_1_date" do
    it "is present" do
      immunisation_history.hep_b_booster_1_date = Date.today
      expect(subject.hep_b_booster_1_date).to eq(l(immunisation_history.hep_b_booster_1_date))
    end

    it "is blank" do
      immunisation_history.hep_b_booster_1_date = nil
      expect(subject.hep_b_booster_1_date).to eq("Not applicable")
    end
  end

  describe "#hep_b_booster_2_date" do
    it "is present" do
      immunisation_history.hep_b_booster_2_date = Date.today
      expect(subject.hep_b_booster_2_date).to eq(l(immunisation_history.hep_b_booster_2_date))
    end

    it "is blank" do
      immunisation_history.hep_b_booster_2_date = nil
      expect(subject.hep_b_booster_2_date).to eq("Not applicable")
    end
  end

  describe "#hep_b_booster_3_date" do
    it "is present" do
      immunisation_history.hep_b_booster_3_date = Date.today
      expect(subject.hep_b_booster_3_date).to eq(l(immunisation_history.hep_b_booster_3_date))
    end

    it "is blank" do
      immunisation_history.hep_b_booster_3_date = nil
      expect(subject.hep_b_booster_3_date).to eq("Not applicable")
    end
  end

  describe "#role involves epps" do
    it "involves epps" do
      immunisation_history.role_involves_epps = true
      expect(subject.role_involves_epps).to eq("The role involves Exposure Prone Procedures (EPPs)")
    end

    it "does not involved epps" do
      immunisation_history.role_involves_epps = false
      expect(subject.role_involves_epps).to eq("The role doesn't involve Exposure Prone Procedures (EPPs)")
    end
  end

end
