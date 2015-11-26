class Report
  require "csv"

  include ActiveModel::Model
  attr_accessor :member_profile_id

  validates :member_profile_id, presence: true, allow_blank: true

  def filename
    "#{ reports_about }-#{ report_type }-#{ I18n.l Date.today }.csv"
  end

  private

  def reports_about
    if member_profile_id.present?
      MemberProfile.select("full_name").find(member_profile_id).full_name.split(" ").map(&:downcase).join("-")
    else
      "all"
    end
  end

  def report_type
    self.class.name.underscore.dasherize
  end
end