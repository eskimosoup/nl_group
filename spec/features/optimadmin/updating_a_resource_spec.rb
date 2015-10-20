require "rails_helper"

RSpec.feature "Updating A Resource", type: :feature, js: true do
  subject!(:resource) { create(:resource) }
  it "should allow a resource to be updated" do
    login_to_admin_with("optimised", "optipoipoip")
    click_link "Resources"

    expect(current_path).to eq(optimadmin.resources_path)
    expect(page).to have_content(resource.name)

    within("#item_#{ resource.id }") do
      find(:xpath, "//a[@href='#{ current_host_and_port }#{ optimadmin.edit_resource_path(resource) }']").click
    end
    expect(page).to have_content("Edit Resource")
    fill_in "Name", with: "New name"
    click_button "Update Resource"

    expect(page).to have_content('Resource was successfully updated.')
  end
end