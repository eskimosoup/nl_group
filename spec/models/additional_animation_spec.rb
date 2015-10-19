require 'rails_helper'
#  rspec --tag "additional_animation"
RSpec.describe AdditionalAnimation, type: :model, additional_content: true do
  describe "validations", :validation do
    subject(:additional_animation) { build(:additional_animation) }
    it { should validate_inclusion_of(:animation_type).in_array(AdditionalAnimation::ANIMATION_TYPES).allow_blank(true) }
  end

  describe "associations", :association do
    it { should belong_to(:additional_title) }
    it { should belong_to(:additional_paragraph) }
    it { should belong_to(:additional_block) }
    it { should belong_to(:additional_button) }
  end

  describe "scopes", :scope do
    let(:additional_animation) { create(:additional_animation) }
    let(:inactive_additional_animation) { create(:additional_animation, active: false) }

    it 'only returns active' do
      expect(AdditionalAnimation.active).not_to include inactive_additional_animation
    end
  end
end
