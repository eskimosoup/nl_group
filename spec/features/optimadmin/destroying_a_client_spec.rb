require 'rails_helper'

RSpec.feature "Destroying A Client", type: :feature do
  subject!(:client) { create(:client) }
  it "should allow a client to be destroyed" do
    login_with("optimised", "optipoipoip")

    click_link "Clients"

    expect(current_path).to eq(optimadmin.clients_path)
    expect(page).to have_content(client.name)

    within("#item_#{ client.id }") do
      find("a[data-method='delete']").click
    end
    # Click ok on confirm
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('Client was successfully destroyed.')
  end
end
