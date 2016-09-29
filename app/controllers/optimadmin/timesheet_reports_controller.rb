module Optimadmin
  class TimesheetReportsController < Optimadmin::ApplicationController
    load_and_authorize_resource
    def new
      @timesheet_report = TimesheetReport.new
    end

    def create
      @timesheet_report = TimesheetReport.new(timesheet_report_params)
      if @timesheet_report.valid?
        send_data @timesheet_report.to_csv, filename: @timesheet_report.filename
      else
        render :new
      end
    end

    private

    def timesheet_report_params
      params.require(:timesheet_report).permit(:member_profile_id)
    end
  end
end
