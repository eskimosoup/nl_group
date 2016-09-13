require 'rails_helper'

RSpec.feature 'user views job roles', type: :feature do
  scenario 'and sees the job role' do
    job_role = create(:job_role, title: 'blah')

    visit job_roles_path

    expect(page).to have_content "blah"
  end
end
