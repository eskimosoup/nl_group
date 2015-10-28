class MemberAddress < ActiveRecord::Base
  belongs_to :member_profile

  validates :member_profile, :address, :lived_here_from, presence: true
  validates :lived_here_to, presence: { message: "can't be blank unless this is your current address" },
            unless: Proc.new{|a| a.current? }
  validates :current, uniqueness: { scope: :member_profile_id }, unless: Proc.new{|a| !a.current? }
end
