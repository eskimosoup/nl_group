class MemberProfilePresenter < BasePresenter
  presents :member_profile

  def email
    member_profile.email
  end
end