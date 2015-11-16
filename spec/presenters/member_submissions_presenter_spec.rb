require "rails_helper"

RSpec.describe MemberSubmissionPresenter, type: :presenter do
  let(:submission) { create(:member_submission) }
  subject{ MemberSubmissionPresenter.new(object: submission, view_template: view) }

  it "#submitted_on" do
    expect(subject.submitted_on).to eq(l(submission.created_at))
  end

  describe "#downloaded_handbook" do
    it "is true" do
      submission.downloaded_handbook = true
      content = <<-END.gsub(/^ {8}/, '')
        I confirm that I have downloaded / received a copy of the Candidate Handbook and that it is my responsibility to
        ensure I have read and understood each section of the handbook; my responsibilities and accountability for the
        role I have applied for.
      END
      expect(subject.downloaded_handbook).to eq(content)
    end

    it "is false" do
      submission.downloaded_handbook = false
      expect(subject.downloaded_handbook).to eq("I have not downloaded the handbook")
    end
  end
end