class MemberProfilePresenter < BasePresenter
  presents :member_profile

  def email
    member_profile.email
  end

  def profile_link
    h.link_to email, h.member_area_member_profile_path, id: "member-profile"
  end

  def edit_profile_link
    h.link_to "Edit Profile", h.edit_member_area_member_profile_path, id: "edit-member-profile"
  end
end