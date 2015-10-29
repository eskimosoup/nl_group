class MemberQualification < ActiveRecord::Base
  belongs_to :member_profile

  validates :member_profile, presence: true
  validates :afc_band, numericality: { only_integer: true }, inclusion: { in: (2..7).to_a }, allow_nil: true
  validates :registration_number, presence: true, if: Proc.new{|z| z.register.present? }
  validates :expiry_date, presence: true, if: Proc.new{|x| x.register.present? }
end
