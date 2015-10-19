require "rails_helper"

RSpec.feature "Updating An FAQ", type: :feature, js: true do
  subject!(:faq) { create(:frequently_asked_question) }
  it "should allow a faq to be destroyed" do
    login_with("optimised", "optipoipoip")

    click_link "FAQs"

    expect(current_path).to eq(optimadmin.frequently_asked_questions_path)
    expect(page).to have_content(faq.question)

    within("#item_#{ faq.id }") do
      find(:xpath, "//a[@href='#{ current_host_and_port }#{ optimadmin.edit_frequently_asked_question_path(faq) }']").click
    end
    expect(page).to have_content("Edit Frequently Asked Question")
    fill_in "Question", with: "New question?"
    click_button "Update Frequently asked question"

    expect(page).to have_content('Frequently asked question was successfully updated.')
  end
end