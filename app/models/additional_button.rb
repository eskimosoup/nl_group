class AdditionalButton < ActiveRecord::Base
  belongs_to :additional_block
  has_one :additional_animation, dependent: :destroy

  validates :additional_block_id, :button_text, :button_link, presence: true
  validates :classes, allow_blank: true, inclusion: { in: AdditionalBlock::CLASSES }

  accepts_nested_attributes_for :additional_animation
  validates_associated :additional_animation

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
