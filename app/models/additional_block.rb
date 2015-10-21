class AdditionalBlock < ActiveRecord::Base
  belongs_to :additional_row, counter_cache: true
  has_one :additional_title, dependent: :destroy
  has_one :additional_paragraph, dependent: :destroy
  has_many :additional_buttons, -> { displayed }, dependent: :destroy
  has_one :additional_animation, dependent: :destroy

  validates :additional_row_id, :name, presence: true

  STYLES = ['testimonial', 'why_work_for_us_reasons', 'frequently_asked_questions', 'rates_of_pay_figures', 'clients_slider']
  CLASSES = [['Light action', 'light-action-button'], ['Dark action', 'dark-action-button']]

  validates :style, allow_blank: true, inclusion: { in: STYLES }
  validates :classes, allow_blank: true, inclusion: { in: CLASSES.map{|c| c[1].to_s} }

  accepts_nested_attributes_for :additional_animation
  validates_associated :additional_animation

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
