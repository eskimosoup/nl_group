require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe "new_contact" do
    let(:contact) { Contact.new(name: "Joe Bloggs", email: "joe.bloggs@example.com", phone_number: "01234 567 890",
                                           message: "Contacting the site") }
    let(:mail) { ContactMailer.new_contact(contact) }

    it "renders the headers" do
      expect(mail.subject).to eq("New contact - #{ site_name }")
      expect(mail.to).to eq([site_email])
      expect(mail.from).to eq([site_email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include(contact.name)
      expect(mail.body.encoded).to include(contact.phone_number)
      expect(mail.body.encoded).to include(contact.email)
      expect(mail.body.encoded).to include(contact.message)
    end
  end

end
