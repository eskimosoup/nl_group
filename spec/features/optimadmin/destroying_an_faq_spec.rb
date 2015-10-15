require "rails_helper"

RSpec.describe "Destroying an FAQ", type: :feature, js: true do

  subject!(:faq){ create(:frequently_asked_question) }

  it "should allow faqs to be deleted" do
    login_with "optimised", "optipoipoip"
    click_link "FAQs"

    expect(current_path).to eq(optimadmin.frequently_asked_questions_path)
    expect(page).to have_content(faq.question)

    within("#item_#{ faq.id }") do
      find("a[data-method='delete']").click
    end
    # Click ok on confirm
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("Frequently asked question was successfully destroyed.")
  end
end