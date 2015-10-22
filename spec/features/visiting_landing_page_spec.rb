require "rails_helper"

RSpec.feature "visiting landing pages", type: :feature do
  subject!(:landing_page) { create(:landing_page) }

  it "should allow viewing of landing pages" do
    visit landing_page_path(landing_page)
    expect(current_path).to eq(landing_page_path(landing_page))
  end

end