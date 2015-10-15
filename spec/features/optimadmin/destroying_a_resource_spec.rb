require 'rails_helper'

RSpec.feature "Destroying A Resource", type: :feature, js: true do
  subject!(:resource) { create(:resource) }
  it "should allow a resource to be destroyed" do
    login_with("optimised", "optipoipoip")

    click_link "Resources"

    expect(current_path).to eq(optimadmin.resources_path)
    expect(page).to have_content(resource.name)

    within("#item_#{ resource.id }") do
      find("a[data-method='delete']").click
    end
    # Click ok on confirm
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('Resource was successfully destroyed.')
  end
end