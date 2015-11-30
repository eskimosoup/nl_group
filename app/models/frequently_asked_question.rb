class FrequentlyAskedQuestion < ActiveRecord::Base

  has_many :landing_page_faqs
  has_many :landing_pages, through: :landing_page_faqs

  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true

  scope :displayed, -> { where(display: true) }
  scope :ordered, -> { order(:question) }
end
