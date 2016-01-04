require 'rails_helper'

RSpec.feature 'Team member modals', type: :feature, modal: true do
  let!(:team_member) { create_list(:team_member_with_image, 1) }
  let!(:additional_row) { create(:additional_row, style: 'team_members', display: true) }
  let!(:additional_block) { create(:additional_block, additional_row: additional_row, display: true, style: '') }

=begin
  it 'shows the modal pop up', js: true do
    visit root_path
    find('.team-members-row-0 .css-animated-hover:first-of-type').click
    puts page.body
    within('#colorbox') do
      expect(page).to have_content(team_member.forename)
    end
  end
=end

  it 'shows the modal content', js: true do
    visit team_member_path(team_member)
    expect(page).to have_content(team_member[0].forename.upcase)
    expect(page).to have_content(team_member[0].surname.upcase)
  end
end
