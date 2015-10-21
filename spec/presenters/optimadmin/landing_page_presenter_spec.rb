require "rails_helper"

RSpec.describe Optimadmin::LandingPagePresenter, type: :presenter do
  let(:landing_page) { build(:landing_page) }
  subject(:landing_page_presenter) { Optimadmin::LandingPagePresenter.new(object: landing_page, view_template: view) }

  it "should return the id" do
    expect(landing_page_presenter.id).to eq(landing_page.id)
  end

  it "should return the name" do
    expect(landing_page_presenter.name).to eq(landing_page.name)
  end

end