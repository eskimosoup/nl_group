class AdditionalRow < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  has_many :additional_row_audiences,
           dependent: :destroy,
           class_name: 'AdditionalRows::Audience'
  has_many :audiences, through: :additional_row_audiences

  has_many :additional_blocks, dependent: :destroy

  STYLES = %w(
    hero_area
    introduction
    why_work_for_us
    rates_of_pay
    clients
    team_members
    frequently_asked_questions
    register_interest_and_find_work

    homecare_hero_area
    homecare_values
    homecare_funding
  ).freeze
  validates :style, allow_blank: true, inclusion: { in: STYLES }

  validates :name, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { case_sensitive: false, message: 'is already taken, leave blank to generate automatically' }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }

  delegate :url_helpers, to: 'Rails.application.routes'

  def custom_menu_item_name
    "#{name} #{"(#{audiences.pluck(:name).join(', ')})" if audiences.present?}"
  end

  def custom_path
    if audiences.size == 1
      "/#{audiences.first.slug}##{slug}"
    else
      "#{url_helpers.root_path}##{slug}"
    end
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
