require "rails_helper"

RSpec.describe Optimadmin::LandingPageWhyWorkPresenter, type: :presenter do
  let(:landing_page_why_work) { build(:landing_page_why_work) }
  subject(:landing_page_why_work_presenter) { Optimadmin::LandingPageWhyWorkPresenter.new(object: landing_page_why_work, view_template: view) }

  it "#id" do
    expect(landing_page_why_work_presenter.id).to eq(landing_page_why_work.id)
  end

  it "#title" do
    expect(landing_page_why_work_presenter.title).to eq(landing_page_why_work.title)
  end

end