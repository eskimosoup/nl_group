require "rails_helper"

RSpec.feature "Updating A Client", type: :feature, js: true do
  subject!(:client) { create(:client) }
  it "should allow a client to be destroyed" do
    login_with("optimised", "optipoipoip")

    click_link "Clients"

    expect(current_path).to eq(optimadmin.clients_path)
    expect(page).to have_content(client.name)

    within("#item_#{ client.id }") do
      find(:xpath, "//a[@href='#{ current_host_and_port }#{ optimadmin.edit_client_path(client) }']").click
    end
    expect(page).to have_content("Edit Client")
    fill_in "Name", with: "New name"
    click_button "Update Client"

    expect(page).to have_content('Client was successfully updated.')
  end
end