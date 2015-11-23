require "rails_helper"

RSpec.feature "Dismissing messages", type: :feature, js: true do
  let(:member_profile) { create(:member_profile) }
  let!(:admin_messages) { create_list(:admin_message, 2) }

  it "should dismiss an admin message when clicked" do
    login_to_member_area_with(member_profile.email, member_profile.password)
    expect(page).to have_css(".admin-message", count: 2)

    click_link admin_messages.first.title
    click_button "Dismiss"

    expect(page).to have_css(".admin-message", count: 1)
  end
end