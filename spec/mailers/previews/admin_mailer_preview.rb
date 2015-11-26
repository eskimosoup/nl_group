# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/registration_complete
  def registration_complete
    AdminMailer.registration_complete(build(:member_profile))
  end

  def referral_made
    @referral = FactoryGirl.build(:referral)
    @referral.member_profile = FactoryGirl.build(:member_profile)
    AdminMailer.referral_made(@referral)
  end

end
