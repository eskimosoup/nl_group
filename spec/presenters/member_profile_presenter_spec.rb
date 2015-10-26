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
end