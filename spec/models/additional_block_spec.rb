require 'rails_helper'
#  rspec --tag "additional_block"
RSpec.describe AdditionalBlock, type: :model, additional_content: true do
  describe "validations", :validation do
    subject(:additional_button) { create(:additional_block) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:additional_row_id) }
    it { should validate_inclusion_of(:style).allow_blank(true).in_array(AdditionalBlock::STYLES) }
    it { should validate_inclusion_of(:classes).allow_blank(true).in_array(AdditionalBlock::CLASSES.map{|c| c[1].to_s}) }
  end

  describe "associations", :association do
    subject(:additional_button) { create(:additional_block) }
    it { should belong_to(:additional_row).counter_cache }
    it { should have_one(:additional_title) }
    it { should have_one(:additional_paragraph) }
    it { should have_many(:additional_buttons) }
    it { should have_one(:additional_animation).dependent(:destroy) }
    it { should accept_nested_attributes_for(:additional_animation) }
  end

  describe "scopes", :scope do
    let(:additional_block) { create(:additional_block) }
    let(:hidden_additional_block) { create(:additional_block, display: false) }

    it 'only returns displayed' do
      expect(AdditionalBlock.displayed).not_to include hidden_additional_block
    end
  end
end
