# Preview all emails at http://localhost:3000/rails/mailers/member_profile_mailer
class MemberProfileMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/member_profile_mailer/password_reset
  def password_reset
    MemberProfileMailer.password_reset(FactoryGirl.build(:member_profile, password_reset_token: "something"))
  end

  def welcome
    MemberProfileMailer.welcome(FactoryGirl.build(:member_profile, password_set_token: "something"))
  end

end
