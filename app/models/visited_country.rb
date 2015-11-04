class VisitedCountry < ActiveRecord::Base
  belongs_to :tuberculosis_chicken_pox_check

  validates :name, :duration, :from_year, :to_year, presence: true
end
