class MemberProfile < ActiveRecord::Base

  belongs_to :key_contact
  has_one :basic_information
  has_one :basic_medical_history
  has_one :dbs_check
  has_one :emergency_contact
  has_one :immunisation_history
  has_one :member_qualification
  has_one :member_training
  has_one :member_submission
  has_one :payment_information
  has_one :tuberculosis_chicken_pox_check
  has_one :work_eligibility
  has_many :member_addresses
  has_many :referees

  delegate :name, to: :key_contact, prefix: true, allow_nil: true

  has_secure_password
  validates :email, presence: true, uniqueness: true

  before_create { generate_token(:auth_token) }

  def request_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while MemberProfile.exists?(column => self[column])
  end
end
