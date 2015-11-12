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

  def member_qualification
    @member_qualification ||= MemberQualification.includes(:qualifications).where(member_profile: member_profile)
  end

  def member_training
    @member_training ||= MemberTraining.includes(:mandatory_training_courses, :member_other_training_courses).where(member_profile: member_profile)
  end
end