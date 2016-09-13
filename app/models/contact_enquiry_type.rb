class ContactEnquiryType < ActiveRecord::Base
  scope :displayed, -> { where(display: true) }

  validates :enquiry_type, presence: true, uniqueness: true
end
