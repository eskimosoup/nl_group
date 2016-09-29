require 'rails_helper'

RSpec.describe Audience, type: :model, audience: true do
  it { should validate_presence_of :title }
  it { should validate_presence_of :name }
  it { should validate_inclusion_of(:name).in_array(Audience::NAMES) }
  it { should validate_uniqueness_of :name }

  describe 'assocations' do
    it { should have_many(:additional_rows_audiences).dependent(:destroy).class_name('::AdditionalRow::Audience') }
    it { should have_many(:audiences).through(:additional_rows_audiences) }
  end

  describe 'friendly id', :friendly_id do
    let(:audience) { create(:audience) }

    it 'creates a slug if title changed' do
      audience.name = 'My new title'
      expect(audience.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      audience.suggested_url = 'my-new-titled-audience'
      expect(audience.should_generate_new_friendly_id?).to be true
    end
  end
end
