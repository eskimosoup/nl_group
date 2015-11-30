require "rails_helper"

RSpec.describe TimesheetPresenter, type: :presenter do
  let(:timesheet) { create(:timesheet) }
  subject{ TimesheetPresenter.new(object: timesheet, view_template: view) }

  it "#created_at" do
    expect(subject.created_at).to eq(l(timesheet.created_at, format: :long))
  end

  it "#download_link" do
    link = link_to("Download", view.member_area_timesheet_path(timesheet, format: :pdf), target: "_blank")
    expect(subject.download_link).to eq(link)
  end
end