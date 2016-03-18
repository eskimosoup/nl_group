class AvailableRole < ActiveRecord::Base
  default_scope { positioned }

  validates :title, :rates_of_pay, presence: true
  validates :title, uniqueness: { case_sensitive: false }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
