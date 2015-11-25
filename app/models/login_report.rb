class LoginReport
  include ActiveModel::Model

  attr_accessor :member_profile_id

  validates :member_profile_id, presence: true, allow_blank: true

  def to_csv
    require "csv"
    attributes = %w{ full_name time }

    CSV.generate(headers: true) do |csv|
      csv << attributes.map(&:titleize)
      member_logins.each do |login|
        csv << attributes.map{ |attr| login.send(attr) }
      end
    end
  end

  private

  def member_logins
    logins = Login.includes(:member_profile).order(created_at: :desc)
    logins = logins.where(member_profile_id: member_profile_id) if member_profile_id.present?
    logins
  end

end