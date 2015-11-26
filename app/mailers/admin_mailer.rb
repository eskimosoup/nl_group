class AdminMailer < ApplicationMailer
  add_template_helper(PresenterHelper)
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.registration_complete.subject
  #
  def registration_complete(member_profile)
    @member_profile = member_profile
    @registration_data = RegistrationData.new(@member_profile)
    attachments["#{ @member_profile.full_name }.pdf"] = {
      mime_type: "application/pdf",
      content: WickedPdf.new.pdf_from_string(render_to_string(pdf: "registration", template: 'member_area/base/registration_data.html.erb'))
    }
    mail to: ApplicationMailer.site_email, subject: "#{ @member_profile.full_name } has completed their registration form"
  end

  def referral_made(referral)
    @referral = referral
    @member_profile = @referral.member_profile
    mail to: ApplicationMailer.site_email, subject: "#{ @member_profile.full_name } has made a referral"
  end
end
