require "rails_helper"
#  rspec --tag "additional_row"
RSpec.describe AdditionalRowPresenter, type: :presenter, additional_content: true do
  let(:additional_row) { build(:additional_row) }
  subject(:additional_row_presenter) { AdditionalRowPresenter.new(object: additional_row, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:additional_row) }
    it { should delegate_method(:id).to(:additional_row) }
  end

  describe "standard additional blocks" do
    it "returns the style" do
      expect(additional_row_presenter.style).to eq(additional_row.style)
    end

    it "returns the anchor friendly string" do
      expect(additional_row_presenter.anchor).to eq(additional_row.custom_path)
    end

    it "returns the displayed, positioned blocks" do
      expect(additional_row_presenter.additional_blocks).to eq(additional_row.additional_blocks.displayed.positioned)
    end
  end
end
