require 'rails_helper'
#  rspec --tag "additional_button"
RSpec.describe AdditionalButton, type: :model, additional_content: true do
  describe "validations", :validation do
    subject(:additional_button) { build(:additional_button) }
    it { should validate_presence_of(:button_text) }
    it { should validate_presence_of(:button_link) }
    it { should validate_presence_of(:additional_block_id) }
    it { should validate_inclusion_of(:classes).allow_blank(true).in_array(AdditionalBlock::CLASSES.map{|c| c[1].to_s}) }
  end

  describe "associations", :association do
    it { should belong_to(:additional_block) }
    it { should have_one(:additional_animation).dependent(:destroy) }
  end

  describe "scopes", :scope do
    let(:additional_button) { create(:additional_button) }
    let(:hidden_additional_button) { create(:additional_button, display: false) }

    it 'only returns displayed' do
      expect(AdditionalButton.displayed).not_to include hidden_additional_button
    end
  end
end
