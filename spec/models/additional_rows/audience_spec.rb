require 'rails_helper'

RSpec.describe AdditionalRows::Audience, type: :model do
  describe 'associations', :association do
    it { should belong_to(:audience).class_name('::Audience') }
    it { should belong_to(:additional_row).class_name('::AdditionalRow') }
  end
end
