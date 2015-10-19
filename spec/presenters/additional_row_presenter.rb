require "rails_helper"
#  rspec --tag "additional_row"
RSpec.describe AdditionalRowPresenter, type: :presenter, additional_row: true do
  let(:additional_row) { build(:additional_row) }
  subject(:additional_row_presenter) { AdditionalRowPresenter.new(object: additional_row, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:additional_row) }
    it { should delegate_method(:style).to(:additional_row) }
  end
end
