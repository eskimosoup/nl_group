class Testimonial < ActiveRecord::Base

  mount_uploader :image, TestimonialUploader

  has_many :landing_page_testimonials
  has_many :landing_pages, through: :landing_page_testimonials

  validates :forename, :surname, :role, :content, presence: true

  scope :displayed, -> { where(display: true) }
  scope :positioned, -> { } #order(:position) }

  def full_name
    [:forename, :surname].compact.join(" ")
  end
end
