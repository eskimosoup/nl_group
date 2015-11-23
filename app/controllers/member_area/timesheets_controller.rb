module MemberArea
  class TimesheetsController < MemberArea::BaseController

    def create
      @timesheet = current_member_profile.timesheets.create
      redirect_to
    end

    def index
      @timesheets = current_member_profile.timesheets
    end

    def show
      @timesheet = current_member_profile.timesheets.find(params[:id])
      render layout: 'timesheet'
    end
  end
end