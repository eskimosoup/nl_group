require 'rails_helper'

RSpec.feature 'managing accreditations' do
  scenario 'successful creation' do
    login_to_admin_with("optimised", "optipoipoip")
    click_link "Accreditations"
    click_link "New Accreditation"
    fill_in "Name", with: "something"
    click_button "Create Accreditation"

    expect(page).to have_content "something"
  end

  scenario 'successful editing' do
    accreditation = create(:accreditation, name: 'something')

    login_to_admin_with("optimised", "optipoipoip")
    visit optimadmin.edit_accreditation_path(accreditation)
    fill_in "Name", with: "Nothing"
    click_button "Update Accreditation"

    expect(page).to have_content "Nothing"
    expect(page).not_to have_content "something"
  end

  scenario 'destroying' do
    accreditation = create(:accreditation, name: 'something')

    login_to_admin_with("optimised", "optipoipoip")
    click_link "Accreditations"
    find("a[data-method='delete']").click

    expect(page).not_to have_content "something"
  end
end
