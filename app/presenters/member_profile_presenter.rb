class MemberProfilePresenter < BasePresenter
  presents :member_profile

  def email
    member_profile.email
  end

  def full_name
    member_profile.full_name
  end

  def profile_link
    h.link_to email, h.member_area_member_profile_path, id: "member-profile"
  end

  def edit_profile_link
    h.link_to "Edit Profile", h.edit_member_area_member_profile_path, id: "edit-member-profile"
  end

  def basic_information_link
    h.link_to "About You", basic_information_path, class: active_class(basic_information_path)
  end

  def work_eligibility_link
    h.link_to "Eligibility To Work", work_eligibility_path, class: active_class(work_eligibility_path)
  end

  def addresses_link
    h.link_to "Address History", addresses_path, class: active_class(addresses_path)
  end

  def member_qualification_link
    h.link_to "Qualifications", qualification_path, class: active_class(qualification_path)
  end

  def member_training_link
    h.link_to "Training", training_path, class: active_class(training_path)
  end

  def referee_and_emergency_contact_link
    h.link_to "Referees and Emergency Contacts", referee_and_emergency_contact_path, class: active_class(referee_and_emergency_contact_path)
  end

  def occupational_health_screening_link
    h.link_to "Occupational Health Screening", occupational_health_screening_path, class: active_class(occupational_health_screening_path)
  end

  def dbs_check_link
    h.link_to "DBS Check", dbs_check_path, class: active_class(dbs_check_path)
  end

  def payment_information_link
    h.link_to "Payment Information", payment_information_path, class: active_class(payment_information_path)
  end

  def progress_icon(method)
    if method
      h.content_tag :i, nil, class: 'fa fa-2x fa-check-square-o'
    else
      h.content_tag :i, nil, class: 'fa fa-2x fa-square-o'
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
    member_submission.present?
  end

  def member_submission
    member_profile.member_submission
  end

  def next_section
    if member_submission?
      nil
    elsif payment_information?
      member_submission_path
    elsif dbs_check?
      payment_information_path
    elsif occupational_health_complete?
      dbs_check_path
    elsif has_referees_and_emergency_contact?
      occupational_health_screening_path
    elsif member_training?
      referee_and_emergency_contact_path
    elsif member_qualification?
      training_path
    elsif has_current_address?
      qualification_path
    elsif work_eligibility?
      addresses_path
    elsif basic_information?
      work_eligibility_path
    else
      basic_information_path
    end
  end

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

  private

  def active_class(route)
    h.current_page?(route) ? 'active' : nil
  end

  def basic_information_path
    if basic_information?
      h.edit_member_area_basic_information_path
    else
      h.new_member_area_basic_information_path
    end
  end

  def work_eligibility_path
    if work_eligibility?
      h.edit_member_area_work_eligibility_path
    else
      h.new_member_area_work_eligibility_path
    end
  end

  def addresses_path
    h.member_area_member_addresses_path
  end

  def qualification_path
    if member_qualification?
      h.edit_member_area_member_qualification_path
    else
      h.new_member_area_member_qualification_path
    end
  end

  def training_path
    if member_training?
      h.edit_member_area_member_training_path
    else
      h.new_member_area_member_training_path
    end
  end

  def referee_and_emergency_contact_path
    h.member_area_referees_and_emergency_contact_path
  end

  def occupational_health_screening_path
    h.member_area_occupational_health_screening_path
  end

  def dbs_check_path
    if dbs_check?
      h.edit_member_area_dbs_check_path
    else
      h.new_member_area_dbs_check_path
    end
  end

  def payment_information_path
    if payment_information?
      h.edit_member_area_payment_information_path
    else
      h.new_member_area_payment_information_path
    end
  end

  def member_submission_path
    h.new_member_area_member_submission_path
  end
end
