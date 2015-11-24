class TimesheetPresenter < BasePresenter
  presents :timesheet

  def created_at
    h.l timesheet.created_at, format: :long
  end

  def download_link
    h.link_to "Download", h.member_area_timesheet_path(timesheet, format: :pdf), target: "_blank"
  end
end
