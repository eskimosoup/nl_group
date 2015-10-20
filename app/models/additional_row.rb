class AdditionalRow < ActiveRecord::Base
  has_many :additional_blocks, dependent: :destroy

  STYLES = ['hero_area', 'introduction', 'testimonial', 'why_work_for_us',
            'rates_of_pay', 'clients', 'team_members', 'frequently_asked_questions']

  validates :style, inclusion: { in: STYLES }
  validates :name, :style, presence: true

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
