require 'rails_helper'

RSpec.describe AdditionalRow, type: :model, additional_content: true do
  describe "validations", :validation do
    subject(:additional_row) { build(:additional_row) }
    it { should validate_presence_of(:name) }
  end

  describe "associations", :association do
    it { should have_many(:additional_blocks).dependent(:destroy) }
  end

  describe "scopes", :scope do
    let(:additional_row) { create(:additional_row) }
    let(:hidden_additional_row) { create(:additional_row, display: false) }

    it 'only returns displayed' do
      expect(AdditionalRow.displayed).not_to include hidden_additional_row
    end
  end
end
