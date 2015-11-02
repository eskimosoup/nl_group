class BasicMedicalHistory < ActiveRecord::Base
  belongs_to :member_profile

  validates :member_profile, :gp_address, presence: true
  validates :treatment_clarification, presence: true, if: Proc.new{|x| x.treatment_clarification_needed? }

  def treatment_clarification_needed?
    having_treatment? || illness_affecting_work? || illness_caused_by_work? || require_assistance?
  end
end
