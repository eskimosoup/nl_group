require 'rails_helper'
#  rspec --tag "additional_paragraph"
RSpec.describe AdditionalParagraph, type: :model, additional_content: true do
  describe "validations", :validation do
    subject(:additional_paragraph) { build(:additional_paragraph) }
    #it { should validate_presence_of(:name) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:additional_block_id) }
  end

  describe "associations", :association do
    it { should belong_to(:additional_block) }
    it { should have_one(:additional_animation).dependent(:destroy) }
  end

  describe "scopes", :scope do
    let(:additional_paragraph) { create(:additional_paragraph) }
    let(:hidden_additional_paragraph) { create(:additional_paragraph, display: false) }

    it 'only returns displayed' do
      expect(AdditionalParagraph.displayed).not_to include hidden_additional_paragraph
    end
  end
end
