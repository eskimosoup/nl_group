class AdditionalRow < ActiveRecord::Base
  has_many :additional_blocks, -> { displayed }, dependent: :destroy

  STYLES = ['hero_area']

  validates :style, inclusion: { in: STYLES }
  validates :name, :style, presence: true

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
