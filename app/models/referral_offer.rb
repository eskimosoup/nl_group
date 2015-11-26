class ReferralOffer < ActiveRecord::Base

  scope :displayed, ->{ where(display: true) }

  validates :title, presence: true
  validates :details, presence: true
  validates :terms_and_conditions, presence: true
end
