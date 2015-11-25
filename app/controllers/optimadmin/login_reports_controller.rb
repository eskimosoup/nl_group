module Optimadmin
  class LoginReportsController < Optimadmin::ApplicationController
    def new
      @login_report = LoginReport.new
    end

    def create
      @login_report = LoginReport.new(login_report_params)
      if @login_report.valid?
        send_data @login_report.to_csv, filename: "login-report-#{ Date.today }.csv"
      else
        render :new
      end
    end

    private

    def login_report_params
      params.require(:login_report).permit(:member_profile_id)
    end
  end
end