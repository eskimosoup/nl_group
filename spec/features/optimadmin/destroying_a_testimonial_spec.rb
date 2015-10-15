require 'rails_helper'

RSpec.feature "Destroying A Testimonial", type: :feature, js: true do
  subject!(:testimonial) { create(:testimonial) }
  it "should allow a client to be destroyed" do
    login_with("optimised", "optipoipoip")

    click_link "Testimonials"

    expect(current_path).to eq(optimadmin.testimonials_path)
    expect(page).to have_content("#{ testimonial.forename } #{ testimonial.surname }")

    within("#item_#{ testimonial.id }") do
      find("a[data-method='delete']").click
    end
    # Click ok on confirm
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('Testimonial was successfully destroyed.')
  end
end