class LandingPage < ActiveRecord::Base
  has_many :landing_page_contents
  has_many :why_work_reasons
  has_many :landing_page_why_works, through: :why_work_reasons
  has_many :landing_page_testimonials
  has_many :testimonials, through: :landing_page_testimonials
  has_many :landing_page_faqs
  has_many :frequently_asked_questions, through: :landing_page_faqs

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  validates :name, presence: true, uniqueness: true
  validates :suggested_url, allow_blank: true, uniqueness: { case_sensitive: false, message: 'is already taken, leave blank to generate automatically' }

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
