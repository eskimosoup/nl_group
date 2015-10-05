# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/new_contact
  def new_contact
    @contact = Contact.new(name: "Joe Bloggs", email: "joe.bloggs@example.com", phone_number: "01234 567 890",
                           message: "Contacting the site")
    ContactMailer.new_contact(@contact)
  end

end
