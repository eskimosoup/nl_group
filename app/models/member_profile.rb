class MemberProfile < ActiveRecord::Base

  has_secure_password
  validates :email, presence: true, uniqueness: true

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while MemberProfile.exists?(column => self[column])
  end
end
