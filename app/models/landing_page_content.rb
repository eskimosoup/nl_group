class LandingPageContent < ActiveRecord::Base

  AREAS = {
    'About Us' => 'about_us',
    'FAQs' => 'faqs',
    'Introduction' => 'introduction',
    'Rates of Pay' => 'rates_of_pay',
    'Reasons' => 'reasons',
    'Testimonials' => 'testimonials'
  }

  belongs_to :landing_page
  delegate :name, to: :landing_page, prefix: true

  validates :landing_page, :content, presence: true
  validates :area, inclusion: { in: AREAS.values }, presence: true

  # override partial path
  def to_partial_path
    "#{ self.class.name.tableize }/#{ area }"
  end
end
