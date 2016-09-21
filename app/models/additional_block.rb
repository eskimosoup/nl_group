class AdditionalBlock < ActiveRecord::Base
  belongs_to :additional_row, counter_cache: true
  has_one :additional_title, dependent: :destroy
  has_one :additional_paragraph, dependent: :destroy
  has_many :additional_buttons, -> { displayed }, dependent: :destroy
  has_one :additional_animation, dependent: :destroy

  validates :additional_row_id, :name, presence: true

  STYLES = [
    # Standard
    'testimonial',
    'why_work_for_us_reasons',
    'frequently_asked_questions',
    'rates_of_pay_figures',
    'clients_slider',
    # Homecare
    'homecare_carers_provide_slider'
  ].freeze
  CLASSES = [
    ['Light action', 'light-action-button'],
    ['Dark action', 'dark-action-button'],
    ['Green action', 'green-action-button'],
    ['Rates of pay introduction', 'rates-of-pay-introduction'],
    ['Rates of pay small print', 'rates-small-print'],
    ['Branded content box', 'branded-content-box'],
    ['Branded content box small typography', 'branded-content-box-small-typography'],
    ['Small branded content box', 'small-branded-content-box'],
    ['Plain bordered content box', 'plain-bordered-content-box']
  ].freeze

  validates :style, allow_blank: true, inclusion: { in: STYLES }
  validates :classes, allow_blank: true, inclusion: { in: CLASSES.map { |c| c[1].to_s } }

  accepts_nested_attributes_for :additional_animation
  validates_associated :additional_animation

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
