require 'rails_helper'

RSpec.feature 'managing audiences', type: :feature do
  scenario 'successful creation' do
    login_to_admin_with("optimised", "optipoipoip")
    click_link "Audiences"
    click_link "New Audience"
    select "Care Seekers", from: "Name"
    click_button "Create Audience"

    expect(page).to have_content "Care Seekers"
  end

  scenario 'successful editing' do
    audience = create(:audience, name: "Care Seekers")

    login_to_admin_with("optimised", "optipoipoip")
    visit optimadmin.edit_audience_path(audience)
    select "Job Seekers", from: "Name"
    click_button "Update Audience"

    expect(page).to have_content "Job Seekers"
  end

  scenario 'destroying' do
    audience = create(:audience, name: "Care Seekers")

    login_to_admin_with("optimised", "optipoipoip")
    click_link "Audiences"
    find("a[data-method='delete']").click

    expect(page).not_to have_content "Care Seekers"
  end
end
