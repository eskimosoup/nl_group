class JobLocationPresenter < BasePresenter
  presents :job_location

  def country
    @country ||= job_location.country
  end

  def country_code
    @country_code ||= job_location.country_code
  end

  def region
    @region ||= job_location.region
  end

  def region_code
    @region_code ||= job_location.region_code
  end

  def city
    @city ||= job_location.city
  end

  def zip_code
    @zip_code ||= job_location.zip_code
  end

  def telecommuting
    if telecommuting?
      "Yes"
    else
      "No"
    end
  end

  private

  def telecommuting?
    @has_telecommuting ||= job_location.telecommuting?
  end

end