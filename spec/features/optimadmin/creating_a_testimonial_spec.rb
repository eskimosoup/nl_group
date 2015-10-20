require 'rails_helper'

RSpec.feature "Creating A Testimonial", type: :feature, js: true do
  it "should allow a testimonial to be created" do
    login_to_admin_with("optimised", "optipoipoip")
    click_link "Testimonials"
    expect(current_path).to eq(optimadmin.testimonials_path)
    click_link "New Testimonial"
    expect(current_path).to eq(optimadmin.new_testimonial_path)

    fill_in "Forename", with: "Joe"
    fill_in "Surname", with: "Bloggs"
    fill_in "Role", with: "Some Role"
    tiny_mce_fill_in "testimonial_content", with: "Pants are pretty sweet."

    click_link "Media"
    attach_file("testimonial_image", File.join(Rails.root, "spec/support/images/landscape_image.jpg"))
    click_button "Create Testimonial"

    expect(current_path).to eq(optimadmin.testimonials_path)
    expect(page).to have_content("Testimonial was successfully created.")
  end
end