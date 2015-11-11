class BasicInformation < ActiveRecord::Base
  TITLES = %w( Mr Mrs Miss Ms Dr Prof )
  WHERE_HEARDS = {
    "NL Group Website" => "website",
    "Web search results" => "search",
    "Job board" => "job_board",
    "Jobsite / Online Job ad" => "online_job_ad",
    "Facebook" => "facebook",
    "Referral from colleague" => "referral",
    "Other" => "other"
  }
  attr_accessor :member_where_heard

  belongs_to :member_profile

  validates :member_profile, :first_name, :last_name, :mobile_number, :date_of_birth, :where_heard, :national_insurance_number,
            presence: true
  validates :email_address, presence: true, uniqueness: true
  validates :title, presence: true, inclusion: { in: TITLES }
  validates :referred_by, presence: { message: "Please specify who referred you" }, if: Proc.new{|a| a.where_heard == "referral" }
  validates :previous_names, presence: true, if: Proc.new{|a| a.changed_name? }
  validates :where_heard, exclusion: { in: %w( other ), message: "You need to specify how you heard about us" }
  validates :member_where_heard, presence: { message: "You must specify where you heard" },
            if: Proc.new{|a| a.where_heard == "other" }
  before_validation :set_where_heard_to_member_suggestion

  def set_where_heard_to_member_suggestion
    self.where_heard = member_where_heard if where_heard == "other" && member_where_heard.present?
  end

end
