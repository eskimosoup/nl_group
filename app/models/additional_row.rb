class AdditionalRow < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  has_many :additional_blocks, dependent: :destroy

  STYLES = ['hero_area', 'introduction', 'why_work_for_us',
            'rates_of_pay', 'clients', 'team_members', 'frequently_asked_questions']
  validates :style, allow_blank: true, inclusion: { in: STYLES }

  validates :name, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { case_sensitive: false, message: 'is already taken, leave blank to generate automatically' }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }

  delegate :url_helpers, to: 'Rails.application.routes'

  def custom_path
    "#{url_helpers.root_path}##{slug}"
  end

  def slug_candidates
    [
      :suggested_url,
      :name,
      [:suggested_url, :name]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || name_changed?
  end
end
