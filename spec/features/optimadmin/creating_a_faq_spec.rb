require "rails_helper"

RSpec.describe "Creating a FAQ", type: :feature do
  it "should allow creating of faqs" do
    login_to_admin_with("optimised", "optipoipoip")

    click_link "FAQs"
    expect(current_path).to eq(optimadmin.frequently_asked_questions_path)

    click_link "New Frequently Asked Question"
    expect(current_path).to eq(optimadmin.new_frequently_asked_question_path)

    fill_in "Question", with: "Some Question?"
    fill_in "Answer", with: "My answer"

    click_button "Create Frequently asked question"

    expect(current_path).to eq(optimadmin.frequently_asked_questions_path)
    expect(page).to have_content "Frequently asked question was successfully created."
  end
end
