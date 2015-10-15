require 'rails_helper'

RSpec.describe FrequentlyAskedQuestion, type: :model do

  subject(:faq) { build(:frequently_asked_question) }

  it { should validate_presence_of(:question) }
  it { should validate_uniqueness_of(:question) }
  it { should validate_presence_of(:answer) }
end
