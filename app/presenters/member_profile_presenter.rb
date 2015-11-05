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

  def payment_declaration_link
    if payment_declaration?
      h.link_to "Payment Declaration", h.edit_member_area_payment_declaration_path
    else
      h.link_to "Payment Declaration", h.new_member_area_payment_declaration_path
    end
  end

  private

  def basic_information?
    basic_information.present?
  end

  def basic_information
    member_profile.basic_information
  end

  def work_eligibility?
    work_eligibility.present?
  end

  def work_eligibility
    member_profile.work_eligibility
  end

  def member_qualification?
    member_qualification.present?
  end

  def member_qualification
    member_profile.member_qualification
  end

  def member_training
    member_profile.member_training
  end

  def member_training?
    member_training.present?
  end

  def dbs_check
    member_profile.dbs_check
  end

  def dbs_check?
    dbs_check
  end

  def payment_declaration
    member_profile.payment_declaration
  end

  def payment_declaration?
    payment_declaration.present?
  end
end
