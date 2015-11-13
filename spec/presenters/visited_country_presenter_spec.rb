require "rails_helper"

RSpec.describe VisitedCountryPresenter, type: :presenter do
  let(:visited_country) { build(:visited_country) }
  subject(:presenter){ VisitedCountryPresenter.new(object: visited_country, view_template: view) }

  it "#name" do
    expect(presenter.name).to eq(visited_country.name)
  end

  it "#duration" do
    expect(presenter.duration).to eq(visited_country.duration)
  end

  it "#from_year" do
    expect(presenter.from_year).to eq(visited_country.from_year)
  end

  it "#to_year" do
    expect(presenter.to_year).to eq(visited_country.to_year)
  end

end