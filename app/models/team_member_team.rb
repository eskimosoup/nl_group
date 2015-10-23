class TeamMemberTeam < ActiveRecord::Base
  has_many :team_members

  validates :name, presence: true

  scope :displayed, -> { where(display: true) }
  scope :positioned, -> { order(:position) }
end
