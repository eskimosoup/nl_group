class AdditionalBlock < ActiveRecord::Base
  belongs_to :additional_row, counter_cache: true
  has_one :additional_title, dependent: :destroy
  has_one :additional_paragraph, dependent: :destroy
  has_many :additional_buttons, -> { displayed }, dependent: :destroy
  has_one :additional_animation, dependent: :destroy

  validates :additional_row_id, :name, presence: true

  STYLES = ['widget']
  validates :style, allow_blank: true, inclusion: { in: STYLES }

  accepts_nested_attributes_for :additional_animation
  validates_associated :additional_animation

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
