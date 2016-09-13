require 'rails_helper'

RSpec.feature 'managing contact enquiry types' do
  scenario 'successful creation' do
    login_to_admin_with("optimised", "optipoipoip")
    click_link "Contact Enquiry Types"
    click_link "New Contact Enquiry Type"
    fill_in "Enquiry type", with: "something"
    click_button "Create Contact enquiry type"

    expect(page).to have_content "something"
  end

  scenario 'successful editing' do
    enquiry = create(:contact_enquiry_type, enquiry_type: 'something')

    login_to_admin_with("optimised", "optipoipoip")
    visit optimadmin.edit_contact_enquiry_type_path(enquiry)
    fill_in "Enquiry type", with: "Nothing"
    click_button "Update Contact enquiry type"

    expect(page).to have_content "Nothing"
    expect(page).not_to have_content "something"
  end

  scenario 'destroying' do
    enquiry = create(:contact_enquiry_type, enquiry_type: 'something')

    login_to_admin_with("optimised", "optipoipoip")
    click_link "Contact Enquiry Types"
    find("a[data-method='delete']").click

    expect(page).not_to have_content "something"
  end
end
