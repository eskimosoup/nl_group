require "rails_helper"

RSpec.describe ImmunisationHistoryPresenter, type: :presenter do
  let(:immunisation_history){ create(:immunisation_history) }
  subject(:immunisation_history_presenter){ ImmunisationHistoryPresenter.new(object: immunisation_history, view_template: view) }

  it "should return an edit link" do
    expect(immunisation_history_presenter.edit_link).to eq(link_to("Edit Immunisation History", edit_member_area_immunisation_history_path))
  end
end
