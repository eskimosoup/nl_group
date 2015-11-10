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


end