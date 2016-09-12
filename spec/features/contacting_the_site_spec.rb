require 'rails_helper'

RSpec.feature "Contacting The Site", type: :feature do
  it "emails site email when entering contact form" do
    visit new_contact_path

    expect(page).to have_content("Contact Us")

    fill_in "Name", with: "Joe Bloggs"
    fill_in "Email", with: "joe.bloggs@example.com"
    fill_in "Phone number", with: "01234 567 890"
    fill_in "Message", with: "I am contacting you..."
    click_button "Send"

    expect(page).to have_content("Thank you for contacting us")
    expect(last_email.to).to include(site_email)
  end

  it "does not email when contact is invalid" do
    visit new_contact_path

    expect(page).to have_content("Contact Us")
    click_button "Send"

    expect(page).to have_content("prevented your message from sending")
    expect(last_email).to eq(nil)
  end
end
