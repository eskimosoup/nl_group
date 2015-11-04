class DbsCheck < ActiveRecord::Base
  belongs_to :member_profile

  validates :member_profile, presence: true
  validates :date_previous_dbs_completed, :company_completed_dbs_check, presence: true, if: Proc.new{|x| x.enhanced_dbs_completed_before? }
  validates :additional_information, presence: true, if: :needs_additional_information?

  def needs_additional_information?
    unprotected_convictions? || unfiltered_convictions? || another_country_police_check? || suspended_or_under_investigation?
  end
end
