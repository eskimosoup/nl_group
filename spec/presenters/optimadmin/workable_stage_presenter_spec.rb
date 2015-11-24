require "rails_helper"

RSpec.describe Optimadmin::WorkableStagePresenter, type: :presenter do
  let(:workable_stage) { build(:workable_stage) }
  subject{ Optimadmin::WorkableStagePresenter.new(object: workable_stage, view_template: view) }

  it "#slug" do
    expect(subject.slug).to eq(workable_stage.slug)
  end

  it "#name" do
    expect(subject.name).to eq(workable_stage.name)
  end

  it "#kind" do
    expect(subject.kind).to eq(workable_stage.kind)
  end
end