require "rails_helper"

RSpec.describe TuberculosisChickenPoxCheckPresenter, type: :presenter do
  let(:tuberculosis_chicken_pox_check) { create(:tuberculosis_chicken_pox_check) }
  subject(:tuberculosis_chicken_pox_check_presenter) { TuberculosisChickenPoxCheckPresenter.new(object: tuberculosis_chicken_pox_check,
                                                                                           view_template: view) }

  it "should return the edit link" do
    expect(tuberculosis_chicken_pox_check_presenter.edit_link).to eq(link_to "Tuberculosis and Chicken Pox Information", edit_member_area_tuberculosis_chicken_pox_check_path)
  end
end

