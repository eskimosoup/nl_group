class KeyContact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true

  validate :communication_method

  def communication_method
    errors.add(:communication_method, "must be present") unless has_communication_method?
  end

  def has_communication_method?
    email.present? || phone_number.present? || mobile_number.present?
  end

end
