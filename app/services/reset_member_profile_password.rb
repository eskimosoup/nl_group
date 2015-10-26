class ResetMemberProfilePassword

  attr_reader :member_profile

  def initialize(member_profile)
    @member_profile = member_profile
  end

  def call
    if member_profile
      member_profile.request_password_reset
      MemberProfileMailer.password_reset(member_profile).deliver_now
    end
  end
end