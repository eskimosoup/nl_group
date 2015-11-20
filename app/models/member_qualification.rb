class MemberQualification < ActiveRecord::Base
  belongs_to :member_profile
  has_many :qualifications
  accepts_nested_attributes_for :qualifications, allow_destroy: true

  validates :member_profile, presence: true
  validates :afc_band, numericality: { only_integer: true, allow_blank: true }, inclusion: { in: (2..7).to_a }, allow_nil: true
  validates :registration_number, presence: true, if: Proc.new{|z| z.register.present? }
  validates :expiry_date, presence: true, if: Proc.new{|x| x.register.present? }
end
