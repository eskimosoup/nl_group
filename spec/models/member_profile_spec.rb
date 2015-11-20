require 'rails_helper'

RSpec.describe MemberProfile, type: :model do
  describe "validations", :validation do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "associations", :association do
    it { should delegate_method(:full_name).to(:team_member).with_prefix }
    it { should belong_to(:team_member) }
    it { should have_one(:basic_information) }
    it { should have_one(:basic_medical_history) }
    it { should have_one(:dbs_check) }
    it { should have_one(:emergency_contact) }
    it { should have_one(:immunisation_history) }
    it { should have_one(:member_qualification) }
    it { should have_one(:member_submission) }
    it { should have_one(:member_training) }
    it { should have_one(:payment_information) }
    it { should have_one(:tuberculosis_chicken_pox_check) }
    it { should have_one(:work_eligibility) }
    it { should have_many(:logins) }
    it { should have_many(:member_addresses) }
    it { should have_many(:message_dismissals) }
    it { should have_many(:referees) }
  end

  describe "password reset" do
    let(:member_profile) { create(:member_profile) }

    it "generates a unique password reset token" do
      member_profile.request_password_reset
      last_token = member_profile.password_reset_token
      member_profile.request_password_reset
      expect(member_profile.password_reset_token).to_not eq(last_token)
    end

    it "saves the time the password reset was requested" do
      member_profile.request_password_reset
      expect(member_profile.reload.password_reset_sent_at).to be
    end
  end
end
