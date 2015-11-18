class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default from: Proc.new{ ApplicationMailer.site_email }
  before_action :global_site_settings

  def self.site_email
    @site_email = begin
      site_setting = Optimadmin::SiteSetting.where(environment: Rails.env).find_by(key: "Email")
      if site_setting
        site_setting.value
      else
        "support@optimised.today"
      end
    end
  end

  def self.site_name
    @site_name = begin
      site_setting = Optimadmin::SiteSetting.where(environment: Rails.env).find_by(key: "Name")
      if site_setting
        site_setting.value
      else
        "Optimised"
      end
    end
  end

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
end
