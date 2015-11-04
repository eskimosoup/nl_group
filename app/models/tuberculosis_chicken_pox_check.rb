class TuberculosisChickenPoxCheck < ActiveRecord::Base
  belongs_to :member_profile
  has_many :visited_countries

  accepts_nested_attributes_for :visited_countries, allow_destroy: true

  validates :member_profile, presence: true
  validates :vaccination_date, presence: true, if: Proc.new{|x| x.bcg_vaccination? }
  validates :additional_information, presence: true, if: :needs_additional_information?
  validates :chicken_pox_date, presence: true, if: Proc.new{|x| x.had_chicken_pox? }

  def needs_additional_information?
    cough? || weight_loss? || fever? || had_tb?
  end

end
