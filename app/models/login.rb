class Login < ActiveRecord::Base
  belongs_to :member_profile

  delegate :full_name, to: :member_profile

  def time
    created_at.strftime("%-d %b %Y - %H:%M")
  end
end
