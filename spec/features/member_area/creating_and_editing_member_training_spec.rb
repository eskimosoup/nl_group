require "rails_helper"

RSpec.feature "Creating and updating member training", type: :feature, js: true do
  let!(:member_profile){ create(:member_profile) }
  let!(:mandatory_training_courses){ create_list(:mandatory_training_course, 4) }

  it "should allow creation of member training" do
    login_to_member_area_with(member_profile.email, "password")

    click_link "Application form"
    click_link "Training"

    expect(current_path).to eq(new_member_area_member_training_path)
    expect(page).to have_content("Training")

    mandatory_training_courses.each do |course|
      check("member_training_mandatory_training_course_ids_#{ course.id }")
    end

    click_link "Add Other Training Course"

    expect(page).to have_selector("#other-training-courses .nested-fields", count: 1)

    within(all("#other-training-courses .nested-fields").last) do
      fill_in "Title", with: "Some Title"
      fill_in "Training provider name", with: "Provider"
    end

    click_button "Save"

    expect(current_path).to eq(member_area_application_form_overview_path)
    expect(page).to have_content "Training successfully saved"
  end

  it "should allow creation of member training" do
    member_training = create(:member_training, member_profile: member_profile)

    login_to_member_area_with(member_profile.email, "password")

    click_link "Application form"
    click_link "Training"

    expect(current_path).to eq(edit_member_area_member_training_path)
    expect(page).to have_content("Training")

    mandatory_training_courses.each do |course|
      check("member_training_mandatory_training_course_ids_#{ course.id }")
    end

    click_link "Add Other Training Course"

    expect(page).to have_selector("#other-training-courses .nested-fields", count: 1)
    within(all("#other-training-courses .nested-fields").last) do
      fill_in "Title", with: "Some Title"
      fill_in "Training provider name", with: "Provider"
    end

    click_button "Save"

    expect(current_path).to eq(member_area_application_form_overview_path)
    expect(page).to have_content "Training successfully updated"
  end
end
