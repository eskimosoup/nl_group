require 'rails_helper'

RSpec.describe LandingPageFaq, type: :model do
  it { should belong_to(:landing_page) }
  it { should belong_to(:frequently_asked_question) }
end

