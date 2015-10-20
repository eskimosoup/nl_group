require "rails_helper"

RSpec.describe "Creating a Resource", type: :feature, js: true do
  it "should allow creating of resources" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Resources"
    expect(current_path).to eq(optimadmin.resources_path)

    click_link "New Resource"
    expect(current_path).to eq(optimadmin.new_resource_path)

    fill_in "Name", with: "Name"
    attach_file("resource_file", File.join(Rails.root, "spec/support/images/landscape_image.jpg"))

    click_button "Create Resource"

    expect(current_path).to eq(optimadmin.resources_path)
    expect(page).to have_content "Resource was successfully created."
  end
end