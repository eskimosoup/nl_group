class Audience < ActiveRecord::Base
  extend FriendlyId

  NAMES = ['Care Seekers'.freeze, 'Job Seekers'.freeze].freeze

  has_and_belongs_to_many :frequently_asked_questions
  has_and_belongs_to_many :testimonials
  has_and_belongs_to_many :work_reasons

  has_many :additional_row_audiences,
           dependent: :destroy,
           class_name: 'AdditionalRows::Audience'
  has_many :additional_rows, through: :additional_row_audiences

  friendly_id :slug_candidates, use: [:slugged, :history]

  validates :name, presence: true, uniqueness: true, inclusion: { in: NAMES }

  def slug_candidates
    [
      :suggested_url,
      :name,
      [:suggested_url, :name]
    ]
  end

  def should_generate_new_friendly_id?
    if slug.blank? || suggested_url_changed? || name_changed?
      true
    else
      false
    end
  end
end
