require 'rails_helper'
#  rspec --tag 'available_role'
RSpec.describe AvailableRole, type: :model, available_role: true do
  describe 'validations', :validation do
    subject(:available_role) { build(:available_role) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:rates_of_pay) }
    it { should validate_uniqueness_of(:title).case_insensitive }
  end

  describe 'scopes', :scope do
    let(:available_role) { create(:available_role) }
    let(:hidden_available_role) { create(:available_role, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(AvailableRole.displayed).not_to include hidden_available_role
      end

      it 'returns displayed records' do
        expect(AvailableRole.displayed).to include available_role
      end
    end
  end
end
