require 'rails_helper'

RSpec.feature 'managing job roles', type: :feature do
  scenario 'successful creation' do
    login_to_admin_with("optimised", "optipoipoip")
    click_link "Job Roles"
    click_link "New Job Role"
    fill_in "Title", with: "Blah"
    fill_in "Summary", with: "Something"
    fill_in "Link", with: "http://www.google.co.uk"
    click_button "Create Job role"

    expect(page).to have_content "Blah"
  end

  scenario 'successful editing' do
    job_role = create(:job_role, title: 'blah')

    login_to_admin_with("optimised", "optipoipoip")
    visit optimadmin.edit_job_role_path(job_role)
    fill_in "Title", with: "Something"
    click_button "Update Job role"

    expect(page).to have_content "Something"
    expect(page).not_to have_content "blah"
  end

  scenario 'destroying' do
    job_role = create(:job_role, title: 'blah')

    login_to_admin_with("optimised", "optipoipoip")
    click_link "Job Roles"
    find("a[data-method='delete']").click

    expect(page).not_to have_content "blah"
  end
end
