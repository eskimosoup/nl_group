require 'rails_helper'

RSpec.feature "Creating A Client", type: :feature, js: true do
  it "should allow a client to be created" do
    login_with("optimised", "optipoipoip")
    click_link "Clients"
    expect(current_path).to eq(optimadmin.clients_path)
    click_link "New Client"
    expect(current_path).to eq(optimadmin.new_client_path)
    fill_in "Name", with: "My Client"
    fill_in "Website", with: "http://www.google.co.uk"
    click_link "Media"
    attach_file("client_logo", File.join(Rails.root, "spec/support/images/landscape_image.jpg"))
    click_button "Create Client"
    expect(current_path).to eq(optimadmin.clients_path)
    expect(page).to have_content("Client was successfully created.")
  end
end
