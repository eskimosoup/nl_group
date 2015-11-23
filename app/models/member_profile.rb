class MemberProfile < ActiveRecord::Base

  belongs_to :team_member
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
  has_many :logins
  has_many :member_addresses
  has_many :message_dismissals
  has_many :dismissed_messages, through: :message_dismissals, source: :admin_message
  has_many :referees

  delegate :full_name, to: :team_member, prefix: true, allow_nil: true

  validates :email, presence: true, uniqueness: true
  # http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html

  has_secure_password(validations: false)
  validate :password_present, on: :update
  validates :password, length: { maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED },
            confirmation: { allow_blank: true }

  before_create do
    generate_token(:auth_token)
    generate_token(:password_set_token) # to allow users to set password initially
  end

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

  def unread_admin_messages
    @admin_messages ||= AdminMessage.displayed.unread_by_member(dismissed_message_ids)
  end

  private

  def password_present
    errors.add(:password, :blank) unless password_digest.present?
  end
end
