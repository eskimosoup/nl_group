require "rails_helper"

RSpec.feature "Creating a page", type: :feature, js: true do
  it "should allow pages to be created" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "Pages"
    expect(current_path).to eq(optimadmin.pages_path)

    click_link "New Page"
    expect(current_path).to eq(optimadmin.new_page_path)
    fill_in "Title", with: "Page Title"
    tiny_mce_fill_in "page_content", with: "My page content"
    click_link "Media"
    attach_file("page_image", File.join(Rails.root, "spec/support/images/landscape_image.jpg"))
    click_button "Create Page"

    expect(current_path).to eq(optimadmin.pages_path)
    expect(page).to have_content("Page was successfully created")

  end
end