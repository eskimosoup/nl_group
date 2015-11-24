module MemberArea
  class TimesheetsController < MemberArea::BaseController

    before_action :use_pdf_specific_template, only: [:show]

    def create
      @timesheet = current_member_profile.timesheets.create
      redirect_to
    end

    def index
      @timesheets = current_member_profile.timesheets
    end

    def show
      @timesheet = current_member_profile.timesheets.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: 'timesheet',
                 layout: 'timesheet.html.erb',
                 margin: { top: 10, left: 5, bottom: 0, right: 5 }
        end
      end
    end

    private

      def use_pdf_specific_template
        return unless env['Rack-Middleware-WickedPdf']
        request.format = 'pdf'
      end
  end
end
