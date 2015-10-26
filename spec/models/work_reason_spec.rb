require 'rails_helper'
#  rspec --tag 'work_reason'
RSpec.describe WorkReason, type: :model, work_reason: true do
  describe 'validations', :validation do
    let(:work_reason) { create(:work_reason) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:colour) }
    it { should validate_inclusion_of(:colour).in_array(WorkReason::THEMES) }
    it { should validate_presence_of(:image) }
  end

  describe 'scopes', :scope do
    let(:work_reason) { create(:work_reason) }
    let(:hidden_work_reason) { create(:work_reason, display: false) }

    it 'only returns displayed' do
      expect(WorkReason.displayed).not_to include hidden_work_reason
    end
  end
end
