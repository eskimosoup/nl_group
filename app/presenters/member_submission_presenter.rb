class MemberSubmissionPresenter < BasePresenter
  presents :member_submission

  def downloaded_handbook
    if has_downloaded_handbook?
      <<-END.gsub(/^ {8}/, '')
        I confirm that I have downloaded / received a copy of the Candidate Handbook and that it is my responsibility to
        ensure I have read and understood each section of the handbook; my responsibilities and accountability for the
        role I have applied for.
      END
    else
      "I have not downloaded the handbook"
    end
  end

  def submitted_on
    @submitted_on ||= h.l member_submission.created_at
  end

  private

  def has_downloaded_handbook?
    @has_downloaded_handbook ||= member_submission.downloaded_handbook?
  end
end