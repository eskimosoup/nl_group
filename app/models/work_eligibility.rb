class WorkEligibility < ActiveRecord::Base
  belongs_to :member_profile

  validates :passport_number, :expiry_date, :member_profile, presence: true
  validates :proof_of_right_to_work, presence: true, if: Proc.new{|a| !a.hold_eu_passport? }
  validate :expiry_date_in_future

  def expiry_date_in_future
    errors.add(:expiry_date, "must be in the future") if expiry_date && expiry_date <= Date.today
  end
end
