require "rails_helper"

RSpec.feature "Creating and updating member training" do
  let!(:member_profile){ create(:member_profile) }
  let!(:mandatory_training_courses){ create_list(:mandatory_training_course, 4) }

  it "should allow creation of member training" do
    login_to_member_area_with(member_profile.email, "password")
    click_link "Training"

    expect(current_path).to eq(new_member_area_member_training_path)
    expect(page).to have_content("Training")

    mandatory_training_courses.each do |course|
      check("member_training_mandatory_training_course_ids_#{ course.id }")
    end

    click_button "Save"

    expect(current_path).to eq(member_area_member_profile_path)
    expect(page).to have_content "Training successfully saved"
  end

  it "should allow creation of member training" do
    member_training = create(:member_training, member_profile: member_profile)

    login_to_member_area_with(member_profile.email, "password")
    click_link "Training"

    expect(current_path).to eq(edit_member_area_member_training_path)
    expect(page).to have_content("Training")

    mandatory_training_courses.each do |course|
      check("member_training_mandatory_training_course_ids_#{ course.id }")
    end

    click_button "Save"

    expect(current_path).to eq(member_area_member_profile_path)
    expect(page).to have_content "Training successfully updated"
  end
end