class BasicInformationPresenter < BasePresenter
  presents :basic_information

  def title
    @title ||= basic_information.title
  end

  def first_name
    @first_name ||= basic_information.first_name
  end

  def middle_names
    @middle_names ||= basic_information.middle_names
  end

  def last_name
    @last_name ||= basic_information.last_name
  end

  def mobile_number
    @mobile_number ||= basic_information.mobile_number
  end

  def home_number
    @home_number ||= basic_information.mobile_number
  end

  def email_address
    @email_address ||= basic_information.email_address
  end

  def changed_name
    @changed_name ||= basic_information.changed_name ? "Yes" : "No"
  end

  def using_current_name_since
    h.l basic_information.using_current_name_since if basic_information.using_current_name_since
  end

  def previous_names
    @previous_names ||= basic_information.previous_names
  end

  def date_of_birth
    @date_of_birth ||= h.l basic_information.date_of_birth
  end

  def national_insurance_number
    @national_insurance_number ||= basic_information.national_insurance_number
  end

  def where_heard
    @where_heard ||= basic_information.where_heard
  end

  def referred_by
    @referred_by ||= basic_information.referred_by
  end

end