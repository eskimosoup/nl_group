require 'rails_helper'
#  rspec --tag "additional_title"
RSpec.describe AdditionalTitle, type: :model, additional_content: true do
  describe "validations", :validation do
    subject(:additional_title) { build(:additional_title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:additional_block_id) }
  end

  describe "associations", :association do
    it { should belong_to(:additional_block) }
    it { should have_one(:additional_animation).dependent(:destroy) }
  end

  describe "scopes", :scope do
    let(:additional_title) { create(:additional_title) }
    let(:hidden_additional_title) { create(:additional_title, display: false) }

    it 'only returns displayed' do
      expect(AdditionalTitle.displayed).not_to include hidden_additional_title
    end
  end
end
