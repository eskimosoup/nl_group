require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  let(:member_profile) { build(:member_profile) }
  describe "#registration_complete" do
    let(:mail) { AdminMailer.registration_complete(member_profile) }

    it "renders the headers" do
      expect(mail.subject).to eq("#{ member_profile.full_name } has completed their registration form")
      expect(mail.to).to include(site_email)
      expect(mail.from).to include(site_email)
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "#referral_made" do
    let(:referral){ build(:referral, member_profile: member_profile) }
    let(:mail) { AdminMailer.referral_made(referral) }

    it "renders the headers" do
      expect(mail.subject).to eq("#{ member_profile.full_name } has made a referral")
      expect(mail.to).to include(site_email)
      expect(mail.from).to include(site_email)
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(referral.name)
    end
  end

end
