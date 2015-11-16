class RegistrationData
  attr_reader :member_profile

  def initialize(member_profile)
    @member_profile = member_profile
  end

  def basic_information
    @basic_information ||= member_profile.basic_information
  end

  def work_eligibility
    @work_eligibility ||= member_profile.work_eligibility
  end

  def addresses
    @addresses ||= MemberAddress.lived_here_from.where(member_profile: member_profile)
  end

  def current_address
    addresses.detect(&:current?)
  end

  def member_qualification
    @member_qualification ||= MemberQualification.includes(:qualifications).where(member_profile: member_profile)
  end

  def member_training
    @member_training ||= MemberTraining.includes(:mandatory_training_courses, :member_other_training_courses).where(member_profile: member_profile)
  end

  def referees
    @referees ||= member_profile.referees
  end

  def emergency_contact
    @emergency_contact ||= member_profile.emergency_contact
  end

  def basic_medical_history
    @basic_medical_history ||= member_profile.basic_medical_history
  end

  def tuberculosis_chicken_pox_check
    @tuberculosis_chicken_pox_check ||= member_profile.tuberculosis_chicken_pox_check
  end

  def immunisation_history
    @immunisation_history ||= member_profile.immunisation_history
  end

  def dbs_check
    @dbs_check ||= member_profile.dbs_check
  end

  def payment_information
    @payment_information ||= member_profile.payment_information
  end

  def member_submission
    @member_submission ||= member_profile.member_submission
  end

end