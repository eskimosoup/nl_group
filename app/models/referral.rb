class Referral < ActiveRecord::Base
  belongs_to :member_profile
  belongs_to :referral_offer

  validates :name, presence: true
  validate :contact_method

  private

  def contact_method
    errors.add(:contact_method, "must be present") unless has_contact_method?
  end

  def has_contact_method?
    email.present? || phone_number.present? || mobile_number.present?
  end
end
