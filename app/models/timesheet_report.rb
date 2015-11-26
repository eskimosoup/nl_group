class TimesheetReport < Report

  def to_csv
    attributes = %w{ full_name time }

    CSV.generate(headers: true) do |csv|
      csv << attributes.map(&:titleize)
      member_timesheets.each do |login|
        csv << attributes.map{ |attr| login.send(attr) }
      end
    end
  end

  private

  def member_timesheets
    Timesheet.includes(:member_profile).for_member(member_profile_id).order(created_at: :desc)
  end
end