require 'rails_helper'

RSpec.describe Audience, type: :model do
  it { should validate_presence_of :name }
  it { should validate_inclusion_of(:name).in_array(Audience::NAMES) }
  it { should validate_uniqueness_of :name }
end
