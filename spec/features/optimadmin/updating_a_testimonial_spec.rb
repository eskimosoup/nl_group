require "rails_helper"

RSpec.describe "Updating a testimonial", type: :feature, js: true do
  subject!(:testimonial) { create(:testimonial) }
  it "should allow updating of testimonial" do
    login_to_admin_with("optimised", "optipoipoip")
    click_link "Testimonials"
    expect(current_path).to eq(optimadmin.testimonials_path)
    expect(page).to have_content(testimonial.forename)

    within("#item_#{ testimonial.id }") do
      find(:xpath, "//a[@href='#{ current_host_and_port }#{ optimadmin.edit_testimonial_path(testimonial) }']").click
    end
    expect(page).to have_content("Edit Testimonial")
    fill_in "Forename", with: "Johnny"
    click_button "Update Testimonial"

    expect(page).to have_content('Testimonial was successfully updated.')
  end
end