class MemberProfileMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_profile_mailer.password_reset.subject
  #
  def password_reset(member_profile)
    @member_profile = member_profile

    mail to: member_profile.email, subject: "Password reset"
  end
end
