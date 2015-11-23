require "rails_helper"

RSpec.describe MemberProfilePresenter, type: :presenter do
  let(:member_profile) { create(:member_profile) }
  subject(:member_profile_presenter){ MemberProfilePresenter.new(object: member_profile, view_template: view) }

  it "should return the email" do
    expect(member_profile_presenter.email).to eq(member_profile.email)
  end

  it "should return a link to the member profile path" do
    expect(member_profile_presenter.profile_link).to eq(link_to(member_profile.email, member_area_member_profile_path,
                                                                id: "member-profile"))
  end

  it "should return a link to edit the profile" do
    expect(member_profile_presenter.edit_profile_link).to eq(link_to("Edit Profile", edit_member_area_member_profile_path,
                                                                     id: "edit-member-profile"))
  end

  it "#full_name" do
    expect(subject.full_name).to eq(member_profile.full_name)
  end



  it "should return a link to a new basic information if no basic information" do
    expect(member_profile_presenter.basic_information_link).to eq(link_to "About You", new_member_area_basic_information_path)
  end

  it "should return an edit link to basic information if basic information exists" do
    basic_information = create(:basic_information, member_profile: member_profile)
    expect(member_profile_presenter.basic_information_link).to eq(link_to "About You", edit_member_area_basic_information_path)
  end

  it "should return a link to new work eligibility if none" do
    expect(member_profile_presenter.work_eligibility_link).to eq(link_to "Eligibility To Work", new_member_area_work_eligibility_path)
  end

  it "should return a link to edit work eligibility if it exists" do
    work_eligibility = create(:work_eligibility, member_profile: member_profile)
    expect(member_profile_presenter.work_eligibility_link).to eq(link_to "Eligibility To Work", edit_member_area_work_eligibility_path)
  end

  it "should return a link to member addresses" do
    expect(member_profile_presenter.addresses_link).to eq(link_to "Address History", member_area_member_addresses_path)
  end

  it "should return a link to create a new member qualification if one doesn't exist" do
    expect(member_profile_presenter.member_qualification_link).to eq(link_to "Qualifications", new_member_area_member_qualification_path)
  end

  it "should return a link to edit member qualification if it exists" do
    member_qualification = create(:member_qualification, member_profile: member_profile)
    expect(member_profile_presenter.member_qualification_link).to eq(link_to "Qualifications", edit_member_area_member_qualification_path)
  end

  it "should return a link to create a member training if one doesn't exist" do
    expect(member_profile_presenter.member_training_link).to eq(link_to "Training", new_member_area_member_training_path)
  end

  it "should return a link to edit member training if one exists" do
    member_qualification = create(:member_training, member_profile: member_profile)
    expect(member_profile_presenter.member_training_link).to eq(link_to "Training", edit_member_area_member_training_path)
  end

  it "should return a link to the referees and emergency contact path" do
    expect(member_profile_presenter.referee_and_emergency_contact_link).to eq(link_to "Referees and Emergency Contacts", member_area_referees_and_emergency_contact_path)
  end

  it "should return a link to the occupational health screening path" do
    expect(member_profile_presenter.occupational_health_screening_link).to eq(link_to "Occupational Health Screening", member_area_occupational_health_screening_path)
  end

  it "should return a link to create a dbs check if one doesn't exist" do
    expect(member_profile_presenter.dbs_check_link).to eq(link_to "DBS Check", new_member_area_dbs_check_path)
  end

  it "should return a link to edit the dbs check if one exists" do
    dbs_check = create(:dbs_check, member_profile: member_profile)
    expect(member_profile_presenter.dbs_check_link).to eq(link_to "DBS Check", edit_member_area_dbs_check_path)
  end

  it "should return a link to create a payment information if one doesn't exist" do
    expect(member_profile_presenter.payment_information_link).to eq(link_to "Payment Information", new_member_area_payment_information_path)
  end

  it "should return a link to edit the payment information if one exists" do
    payment_information = create(:payment_information, member_profile: member_profile)
    expect(member_profile_presenter.payment_information_link).to eq(link_to "Payment Information", edit_member_area_payment_information_path)
  end

  describe "checking occupational health sections completed" do
    it "should be complete" do
      allow(member_profile_presenter).to receive(:basic_medical_history?) { true }
      allow(member_profile_presenter).to receive(:tuberculosis_chicken_pox_check?) { true }
      allow(member_profile_presenter).to receive(:immunisation_history?) { true }

      expect(member_profile_presenter.occupational_health_complete?).to be true
    end

    it "should not be complete with no basic medical history" do
      allow(member_profile_presenter).to receive(:basic_medical_history?) { false }
      allow(member_profile_presenter).to receive(:tuberculosis_chicken_pox_check?) { true }
      allow(member_profile_presenter).to receive(:immunisation_history?) { true }

      expect(member_profile_presenter.occupational_health_complete?).to be false
    end

    it "should not be complete with no tuberculosis chicken pox check" do
      allow(member_profile_presenter).to receive(:basic_medical_history?) { true }
      allow(member_profile_presenter).to receive(:tuberculosis_chicken_pox_check?) { false }
      allow(member_profile_presenter).to receive(:immunisation_history?) { true }

      expect(member_profile_presenter.occupational_health_complete?).to be false
    end

    it "should not be complete with no immunisation history" do
      allow(member_profile_presenter).to receive(:basic_medical_history?) { true }
      allow(member_profile_presenter).to receive(:tuberculosis_chicken_pox_check?) { true }
      allow(member_profile_presenter).to receive(:immunisation_history?) { false }

      expect(member_profile_presenter.occupational_health_complete?).to be false
    end
  end

  describe "general information complete" do
    it "should be true if everything complete" do
      allow(member_profile_presenter).to receive(:basic_information?) { true }
      allow(member_profile_presenter).to receive(:has_current_address?) { true }
      expect(member_profile_presenter.general_information_complete?).to be true
    end

    it "should be false if no basic info" do
      allow(member_profile_presenter).to receive(:basic_information?) { false }
      allow(member_profile_presenter).to receive(:has_current_address?) { true }
      expect(member_profile_presenter.general_information_complete?).to be false
    end

    it "should be false if no current address" do
      allow(member_profile_presenter).to receive(:basic_information?) { true }
      allow(member_profile_presenter).to receive(:has_current_address?) { false }
      expect(member_profile_presenter.general_information_complete?).to be false
    end
  end

  describe "qualification and training checking" do
    it "should be true if everything complete" do
      allow(member_profile_presenter).to receive(:member_qualification?) { true }
      allow(member_profile_presenter).to receive(:member_training?) { true }
      expect(member_profile_presenter.training_and_qualification_complete?).to be true
    end

    it "should be false if no member qualification" do
      allow(member_profile_presenter).to receive(:member_qualification?) { false }
      allow(member_profile_presenter).to receive(:member_training?) { true }
      expect(member_profile_presenter.training_and_qualification_complete?).to be false
    end

    it "should be false if no member training" do
      allow(member_profile_presenter).to receive(:member_training?) { false }
      allow(member_profile_presenter).to receive(:member_qualification?) { true }
      expect(member_profile_presenter.training_and_qualification_complete?).to be false
    end
  end

  describe "has dbs_check_and_work_eligibility_complete" do
    it "should be true if everything complete" do
      allow(member_profile_presenter).to receive(:work_eligibility?) { true }
      allow(member_profile_presenter).to receive(:dbs_check?) { true }
      expect(member_profile_presenter.dbs_check_and_work_eligibility_complete?).to be true
    end

    it "should be false if no work eligibility" do
      allow(member_profile_presenter).to receive(:work_eligibility?) { false }
      allow(member_profile_presenter).to receive(:dbs_check?) { true }
      expect(member_profile_presenter.dbs_check_and_work_eligibility_complete?).to be false
    end

    it "should be false if no dbs check" do
      allow(member_profile_presenter).to receive(:work_eligibility?) { true }
      allow(member_profile_presenter).to receive(:dbs_check?) { false }
      expect(member_profile_presenter.dbs_check_and_work_eligibility_complete?).to be false
    end
  end

  describe "has referees and emergency_contact" do
    it "should be true if everything complete" do
      allow(member_profile_presenter).to receive(:has_referees?) { true }
      allow(member_profile_presenter).to receive(:emergency_contact?) { true }
      expect(member_profile_presenter.has_referees_and_emergency_contact?).to be true
    end

    it "should be true if number of referees is not 2" do
      allow(member_profile_presenter).to receive(:has_referees?) { false }
      allow(member_profile_presenter).to receive(:emergency_contact?) { true }
      expect(member_profile_presenter.has_referees_and_emergency_contact?).to be false
    end

    it "should be true if no emergency contact" do
      allow(member_profile_presenter).to receive(:has_referees?) { true }
      allow(member_profile_presenter).to receive(:emergency_contact?) { false }
      expect(member_profile_presenter.has_referees_and_emergency_contact?).to be false
    end
  end

  it "should be true if ready to submit" do
    allow(member_profile_presenter).to receive(:payment_information?) { true }
    allow(member_profile_presenter).to receive(:occupational_health_complete?) { true }
    allow(member_profile_presenter).to receive(:general_information_complete?) { true }
    allow(member_profile_presenter).to receive(:training_and_qualification_complete?) { true }
    allow(member_profile_presenter).to receive(:dbs_check_and_work_eligibility_complete?) { true }
    allow(member_profile_presenter).to receive(:has_referees_and_emergency_contact?) { true }
    expect(member_profile_presenter.ready_to_submit?).to be true
  end
end