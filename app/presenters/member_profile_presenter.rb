class MemberProfilePresenter < BasePresenter
  presents :member_profile

  def email
    member_profile.email
  end

  def profile_link
    h.link_to email, h.member_area_member_profile_path, id: "member-profile"
  end

  def edit_profile_link
    h.link_to "Edit Profile", h.edit_member_area_member_profile_path, id: "edit-member-profile"
  end

  def basic_information_link
    if basic_information?
      h.link_to "About You", h.edit_member_area_basic_information_path
    else
      h.link_to "About You", h.new_member_area_basic_information_path
    end
  end

  def work_eligibility_link
    if work_eligibility?
      h.link_to "Eligibility To Work", h.edit_member_area_work_eligibility_path
    else
      h.link_to "Eligibility To Work", h.new_member_area_work_eligibility_path
    end
  end

  def addresses_link
    h.link_to "Address History", h.member_area_member_addresses_path
  end

  def member_qualification_link
    if member_qualification?
      h.link_to "Qualifications", h.edit_member_area_member_qualification_path
    else
      h.link_to "Qualifications", h.new_member_area_member_qualification_path
    end
  end

  def member_training_link
    if member_training?
      h.link_to "Training", h.edit_member_area_member_training_path
    else
      h.link_to "Training", h.new_member_area_member_training_path
    end
  end

  def referee_and_emergency_contact_link
    h.link_to "Referees and Emergency Contacts", h.member_area_referees_and_emergency_contact_path
  end

  def occupational_health_screening_link
    h.link_to "Occupational Health Screening", h.member_area_occupational_health_screening_path
  end

  def dbs_check_link
    if dbs_check?
      h.link_to "DBS Check", h.edit_member_area_dbs_check_path
    else
      h.link_to "DBS Check", h.new_member_area_dbs_check_path
    end
  end

  def payment_information_link
    if payment_information?
      h.link_to "Payment Information", h.edit_member_area_payment_information_path
    else
      h.link_to "Payment Information", h.new_member_area_payment_information_path
    end
  end

  def occupational_health_complete?
    basic_medical_history? && tuberculosis_chicken_pox_check? && immunisation_history?
  end

  def general_information_complete?
    basic_information? && has_current_address?
  end

  def training_and_qualification_complete?
    member_training? && member_qualification?
  end

  def dbs_check_and_work_eligibility_complete?
    dbs_check? && work_eligibility?
  end

  def has_referees_and_emergency_contact?
    has_referees? && emergency_contact?
  end

  def ready_to_submit?
    payment_information? && occupational_health_complete? && general_information_complete? && training_and_qualification_complete? &&
        dbs_check_and_work_eligibility_complete? && has_referees_and_emergency_contact?
  end

  def member_submission?
    member_profile.member_submission.present?
  end

  private

  def basic_information?
    member_profile.basic_information.present?
  end

  def work_eligibility?
    member_profile.work_eligibility.present?
  end

  def member_qualification?
    member_profile.member_qualification.present?
  end

  def member_training?
    member_profile.member_training.present?
  end

  def dbs_check?
    member_profile.dbs_check.present?
  end

  def payment_information?
    member_profile.payment_information.present?
  end

  def basic_medical_history?
    member_profile.basic_medical_history.present?
  end

  def immunisation_history?
    member_profile.immunisation_history.present?
  end

  def tuberculosis_chicken_pox_check?
    member_profile.tuberculosis_chicken_pox_check.present?
  end

  def has_current_address?
    member_profile.member_addresses.exists?(current: true)
  end

  def has_referees?
    member_profile.referees.count == 2
  end

  def emergency_contact?
    member_profile.emergency_contact.present?
  end
end
