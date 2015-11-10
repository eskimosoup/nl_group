require "rails_helper"

RSpec.describe WorkEligibilityPresenter, type: :presenter do
  let(:work_eligibility) { create(:work_eligibility) }
  subject(:work_eligibility_presenter) { WorkEligibilityPresenter.new(object: work_eligibility, view_template: view) }

  it "should return the passport number" do
    expect(work_eligibility_presenter.passport_number).to eq(work_eligibility.passport_number)
  end

  it "should return a localised expiry date" do
    expect(work_eligibility_presenter.expiry_date).to eq(l(work_eligibility.expiry_date))
  end

  it "should return the nationality" do
    expect(work_eligibility_presenter.nationality).to eq(work_eligibility.nationality)
  end

  it "should return yes if holds eu passport" do
    work_eligibility.hold_eu_passport = true
    expect(work_eligibility_presenter.hold_eu_passport).to eq("Yes")
  end

  it "should return yes if does not hold eu passport" do
    work_eligibility.hold_eu_passport = false
    expect(work_eligibility_presenter.hold_eu_passport).to eq("No")
  end

  it "should return proof of right to work when does not hold eu passport" do
    work_eligibility.hold_eu_passport = false
    expect(work_eligibility_presenter.proof_of_right_to_work).to eq(work_eligibility.proof_of_right_to_work)
  end

  it "should return not applicable when holds an eu passport" do
    work_eligibility.hold_eu_passport = true
    expect(work_eligibility_presenter.proof_of_right_to_work).to eq("Not applicable")
  end
end