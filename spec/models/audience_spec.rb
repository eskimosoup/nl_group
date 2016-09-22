require 'rails_helper'

RSpec.describe Audience, type: :model do
  it { should validate_presence_of :name }
  it { should validate_inclusion_of(:name).in_array(Audience::NAMES) }
  it { should validate_uniqueness_of :name }

  describe 'assocations' do
    it { should have_many(:additional_rows_audiences).dependent(:destroy).class_name('::AdditionalRow::Audience') }
    it { should have_many(:audiences).through(:additional_rows_audiences) }
  end
end
