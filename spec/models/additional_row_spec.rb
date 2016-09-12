require 'rails_helper'

RSpec.describe AdditionalRow, type: :model, additional_content: true do
  describe "validations", :validation do
    subject(:additional_row) { build(:additional_row) }
    it { should validate_presence_of(:name) }
    it { should validate_inclusion_of(:style).allow_blank(true).in_array(AdditionalRow::STYLES) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message("is already taken, leave blank to generate automatically") }
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

  describe 'methods', :methods do
    let(:additional_row) { create(:additional_row) }

    context "responds to its custom path" do
      it { expect(additional_row).to respond_to(:custom_path) }
    end

    context "executes custom path method correctly" do
      it "shows a custom path" do
        expect(additional_row.custom_path).to eq("#{root_path}##{additional_row.slug}")
      end
    end
  end

  describe 'friendly id', :friendly_id do
    let(:additional_row) { create(:additional_row) }

    it 'creates a slug if name changed' do
      additional_row.name = 'My new title'
      expect(additional_row.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      additional_row.suggested_url = 'my-new-titled-page'
      expect(additional_row.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      additional_row = create(:additional_row)
      additional_row.style = 'Gobbledegook'
      expect(additional_row.should_generate_new_friendly_id?).to be false
    end
  end
end
