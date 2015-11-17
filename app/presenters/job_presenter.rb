class JobPresenter < BasePresenter
  presents :job

  def full_title
    @full_title ||= job.full_title
  end

  def department
    @department ||= job.department
  end

  def url(options = {})
    @url ||= h.link_to "View Job", job.url, options
  end

  def application_url(options = {})
    @application_url ||= h.link_to "Apply Here", job.application_url, options
  end
end