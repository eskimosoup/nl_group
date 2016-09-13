require 'rails_helper'

RSpec.feature 'user visits homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css "h1", text: I18n.t('views.homepage.h1')
  end
end
