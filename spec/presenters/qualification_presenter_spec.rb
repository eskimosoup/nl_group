require "rails_helper"

RSpec.describe QualificationPresenter, type: :presenter do
  let(:qualification) { create(:qualification) }
  subject(:qualification_presenter){ QualificationPresenter.new(object: qualification, view_template: view) }

  it "returns the name" do
    expect(qualification_presenter.name).to eq(qualification.name)
  end

  it "returns the grade_obtained" do
    expect(qualification_presenter.grade_obtained).to eq(qualification.grade_obtained)
  end

  it "returns the localised completed_date" do
    expect(qualification_presenter.completed_date).to eq(l(qualification.completed_date))
  end
end