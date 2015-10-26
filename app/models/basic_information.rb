class BasicInformation < ActiveRecord::Base

  TITLES = %w( Mr Mrs Miss Ms Dr Prof )
  attr_accessor :member_where_heard

  belongs_to :member_profile

  validates :member_profile, :first_name, :last_name, :mobile_number, :date_of_birth, :where_heard, :national_insurance_number,
            presence: true
  validates :email_address, presence: true, uniqueness: true
  validates :title, presence: true, inclusion: { in: TITLES }
  validates :referred_by, presence: true, if: Proc.new{|a| a.where_heard == "referral" }
  validates :previous_names, presence: true, if: Proc.new{|a| a.changed_name? }
  before_save :set_where_heard_to_member_suggestion

  def set_where_heard_to_member_suggestion
    self.where_heard = member_where_heard if where_heard == "other" && member_where_heard.present?
  end
end
