require "rails_helper"

RSpec.describe MemberProfileMailer, type: :mailer do
  describe "password_reset" do
    let(:member_profile) { create(:member_profile, password_reset_token: "anything") }
    let(:mail) { MemberProfileMailer.password_reset(member_profile) }

    it "renders the headers" do
      expect(mail.subject).to eq("Password reset")
      expect(mail.to).to eq([member_profile.email])
      expect(mail.from).to eq([ApplicationMailer.site_email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include(edit_member_area_password_reset_path(member_profile.password_reset_token))

    end
  end

end
