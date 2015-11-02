require "rails_helper"

RSpec.describe MemberProfilePresenter, type: :presenter do
  let(:member_profile) { create(:member_profile) }
  subject(:member_profile_presenter){ MemberProfilePresenter.new(object: member_profile, view_template: view) }

  it "should return the email" do
    expect(member_profile_presenter.email).to eq(member_profile.email)
  end

  it "should return a link to the member profile path" do
    expect(member_profile_presenter.profile_link).to eq(link_to(member_profile.email, member_area_member_profile_path,
                                                                id: "member-profile"))
  end

  it "should return a link to edit the profile" do
    expect(member_profile_presenter.edit_profile_link).to eq(link_to("Edit Profile", edit_member_area_member_profile_path,
                                                                     id: "edit-member-profile"))
  end

  it "should return a link to a new basic information if no basic information" do
    expect(member_profile_presenter.basic_information_link).to eq(link_to "About You", new_member_area_basic_information_path)
  end

  it "should return an edit link to basic information if basic information exists" do
    basic_information = create(:basic_information, member_profile: member_profile)
    expect(member_profile_presenter.basic_information_link).to eq(link_to "About You", edit_member_area_basic_information_path)
  end

  it "should return a link to new work eligibility if none" do
    expect(member_profile_presenter.work_eligibility_link).to eq(link_to "Eligibility To Work", new_member_area_work_eligibility_path)
  end

  it "should return a link to edit work eligibility if it exists" do
    work_eligibility = create(:work_eligibility, member_profile: member_profile)
    expect(member_profile_presenter.work_eligibility_link).to eq(link_to "Eligibility To Work", edit_member_area_work_eligibility_path)
  end

  it "should return a link to member addresses" do
    expect(member_profile_presenter.addresses_link).to eq(link_to "Address History", member_area_member_addresses_path)
  end

  it "should return a link to create a new member qualification if one doesn't exist" do
    expect(member_profile_presenter.member_qualification_link).to eq(link_to "Qualifications", new_member_area_member_qualification_path)
  end

  it "should return a link to edit member qualification if it exists" do
    member_qualification = create(:member_qualification, member_profile: member_profile)
    expect(member_profile_presenter.member_qualification_link).to eq(link_to "Qualifications", edit_member_area_member_qualification_path)
  end

  it "should return a link to create a member training if one doesn't exist" do
    expect(member_profile_presenter.member_training_link).to eq(link_to "Training", new_member_area_member_training_path)
  end

  it "should retun a link to edit member training if one exists" do
    member_qualification = create(:member_training, member_profile: member_profile)
    expect(member_profile_presenter.member_training_link).to eq(link_to "Training", edit_member_area_member_training_path)
  end

  it "should return a link to the referees and emergency contact path" do
    expect(member_profile_presenter.referee_and_emergency_contact_link).to eq(link_to "Referees and Emergency Contacts", member_area_referees_and_emergency_contact_path)
  end


end