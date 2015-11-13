require "rails_helper"

RSpec.describe DbsCheckPresenter, type: :presenter do
  let(:dbs_check) { build(:dbs_check) }
  subject{ DbsCheckPresenter.new(object: dbs_check, view_template: view) }

  describe "has completed dbs check" do
    let(:dbs_check) { build(:dbs_check, enhanced_dbs_completed_before: true) }
    subject{ DbsCheckPresenter.new(object: dbs_check, view_template: view) }

    it "#prior_dbs_check?" do
      expect(subject.prior_dbs_check?).to be true
    end

    it "#enhanced_dbs_completed_before" do
      expect(subject.enhanced_dbs_completed_before).to eq("Yes")
    end

    it "#previous_disclosure_number" do
      expect(subject.previous_disclosure_number).to eq(dbs_check.previous_disclosure_number)
    end

    it "#date_previous_dbs_completed" do
      expect(subject.date_previous_dbs_completed).to eq(l(dbs_check.date_previous_dbs_completed))
    end

    it "#company_completed_dbs_check" do
      expect(subject.company_completed_dbs_check).to eq(dbs_check.company_completed_dbs_check)
    end
  end

  describe "has not completed dbs check" do
    let(:dbs_check) { build(:dbs_check, enhanced_dbs_completed_before: false) }
    subject{ DbsCheckPresenter.new(object: dbs_check, view_template: view) }

    it "#prior_dbs_check?" do
      expect(subject.prior_dbs_check?).to be false
    end

    it "#enhanced_dbs_completed_before" do
      expect(subject.enhanced_dbs_completed_before).to eq("No")
    end

    it "#previous_disclosure_number" do
      expect(subject.previous_disclosure_number).to eq("Not applicable")
    end

    it "#date_previous_dbs_completed" do
      expect(subject.date_previous_dbs_completed).to eq("Not applicable")
    end

    it "#company_completed_dbs_check" do
      expect(subject.company_completed_dbs_check).to eq("Not applicable")
    end
  end

  describe "#unprotected_convictions" do
    it "is true" do
      dbs_check.unprotected_convictions = true
      expect(subject.unprotected_convictions).to eq("Yes")
    end

    it "is false" do
      dbs_check.unprotected_convictions = false
      expect(subject.unprotected_convictions).to eq("No")
    end
  end

  describe "#unfiltered_convictions" do
    it "is true" do
      dbs_check.unfiltered_convictions = true
      expect(subject.unfiltered_convictions).to eq("Yes")
    end

    it "is false" do
      dbs_check.unfiltered_convictions = false
      expect(subject.unfiltered_convictions).to eq("No")
    end
  end

  describe "#another_country_police_check" do
    it "is true" do
      dbs_check.another_country_police_check = true
      expect(subject.another_country_police_check).to eq("Yes")
    end

    it "is false" do
      dbs_check.another_country_police_check = false
      expect(subject.another_country_police_check).to eq("No")
    end
  end

  describe "#suspended_or_under_investigation" do
    it "is true" do
      dbs_check.suspended_or_under_investigation = true
      expect(subject.suspended_or_under_investigation).to eq("Yes")
    end

    it "is false" do
      dbs_check.suspended_or_under_investigation = false
      expect(subject.suspended_or_under_investigation).to eq("No")
    end
  end

  it "#additional information" do
    expect(subject.additional_information).to eq(dbs_check.additional_information)
  end
end
