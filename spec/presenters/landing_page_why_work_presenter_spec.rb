require "rails_helper"

RSpec.describe LandingPageWhyWorkPresenter, type: :presenter do
  let(:landing_page_why_work) { create(:landing_page_why_work) }
  subject { LandingPageWhyWorkPresenter.new(object: landing_page_why_work, view_template: view) }

  it "#title" do
    expect(subject.title).to eq(landing_page_why_work.title)
  end

  it "#content" do
    expect(subject.content).to eq(raw(landing_page_why_work.content))
  end

  it "#classes" do
    expect(subject.classes).to eq(["reason", landing_page_why_work.reason_type].join(" "))
  end
end