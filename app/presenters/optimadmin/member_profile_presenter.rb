module Optimadmin
  class MemberProfilePresenter < Optimadmin::BasePresenter
    presents :member_profile
    delegate :id, to: :member_profile
    delegate :key_contact_name, to: :member_profile, allow_nil: true

    def email
      member_profile.email
    end
  end
end
