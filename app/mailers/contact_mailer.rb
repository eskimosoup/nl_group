class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_contact.subject
  #
  def new_contact(contact)
    @contact = contact

    mail to: ApplicationMailer.site_email, subject: "New contact - #{ ApplicationMailer.site_name }"
  end
end
