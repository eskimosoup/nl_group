class LandingPageWhyWork < ActiveRecord::Base

  has_many :why_work_reasons
  has_many :landing_pages, through: :why_work_reasons

  scope :displayed, ->{ where(display: true) }

  REASON_TYPES = {
    "Money" => "money",
    "Number One" => "number-1",
    "Flexible" => "flexible",
    "Northerners" => "northerners"
  }

  validates :title, :content, presence: true
  validates :reason_type, presence: true, inclusion: { in: REASON_TYPES.values }
end
