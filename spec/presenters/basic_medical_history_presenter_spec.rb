require "rails_helper"

RSpec.describe BasicMedicalHistoryPresenter, type: :presenter do
  let(:basic_medical_history){ create(:basic_medical_history) }
  subject(:basic_medical_history_presenter){ BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view) }

  it "should return the gp address" do
    expect(basic_medical_history_presenter.gp_address).to eq(basic_medical_history.gp_address)
  end

  it "should return treatment clarification" do
    expect(basic_medical_history_presenter.treatment_clarification).to eq(basic_medical_history.treatment_clarification)
  end

  it "should return the edit link" do
    expect(basic_medical_history_presenter.edit_link).to eq(link_to "Edit Basic Medical History", edit_member_area_basic_medical_history_path, class: 'user-action-button')
  end

  describe "illness affecting work is true" do
    let(:basic_medical_history){ create(:basic_medical_history, illness_affecting_work: true) }
    subject(:basic_medical_history_presenter){ BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view) }

    it "should an appropriate string" do
      expect(basic_medical_history_presenter.illness_affecting_work).to eq("I have an illness/impairment/disability (physical or psychological) which may affect my work")
    end
  end

  describe "illness affecting work is false" do
    let(:basic_medical_history){ create(:basic_medical_history, illness_affecting_work: false) }
    subject(:basic_medical_history_presenter){ BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view) }

    it "should an appropriate string" do
      expect(basic_medical_history_presenter.illness_affecting_work).to eq("I do not have an illness/impairment/disability (physical or psychological) which may affect my work")
    end
  end


  describe "illness_caused_by_work is true" do
    let(:basic_medical_history){ create(:basic_medical_history, illness_caused_by_work: true) }
    subject(:basic_medical_history_presenter){ BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view) }

    it "should an appropriate string" do
      expect(basic_medical_history_presenter.illness_caused_by_work).to eq("I have had an illness/impairment/disability (physical or psychological) which may have been caused or made worse by your work")
    end
  end

  describe "illness_caused_by_work is false" do
    let(:basic_medical_history){ create(:basic_medical_history, illness_caused_by_work: false) }
    subject(:basic_medical_history_presenter){ BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view) }

    it "should an appropriate string" do
      expect(basic_medical_history_presenter.illness_caused_by_work).to eq("I have never had an illness/impairment/disability (physical or psychological) which may have been caused or made worse by your work")
    end
  end

  describe "require_assistance is true" do
    let(:basic_medical_history){ create(:basic_medical_history, require_assistance: true) }
    subject(:basic_medical_history_presenter){ BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view) }

    it "should an appropriate string" do
      expect(basic_medical_history_presenter.require_assistance).to eq("I think I may need some adjustments or assistance to help me to do the job")
    end
  end

  describe "require_assistance is false" do
    let(:basic_medical_history){ create(:basic_medical_history, require_assistance: false) }
    subject(:basic_medical_history_presenter){ BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view) }

    it "should an appropriate string" do
      expect(basic_medical_history_presenter.require_assistance).to eq("I do not think I need adjustments or assistance to help me to do the job")
    end
  end

  describe "having_treatment is true" do
    let(:basic_medical_history){ create(:basic_medical_history, having_treatment: true) }
    subject(:basic_medical_history_presenter){ BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view) }

    it "should an appropriate string" do
      expect(basic_medical_history_presenter.having_treatment).to eq("I am having or waiting for treatment (including medication) or investigations at present")
    end
  end

  describe "having_treatment is false" do
    let(:basic_medical_history){ create(:basic_medical_history, having_treatment: false) }
    subject(:basic_medical_history_presenter){ BasicMedicalHistoryPresenter.new(object: basic_medical_history, view_template: view) }

    it "should an appropriate string" do
      expect(basic_medical_history_presenter.having_treatment).to eq("I am not having or waiting for treatment (including medication) or investigations at present")
    end
  end

end
