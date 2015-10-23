class TeamMember < ActiveRecord::Base

  mount_uploader :image, TeamMemberUploader
  validates :forename, :surname, :role, presence: true
  belongs_to :team_member_team

  scope :displayed, -> { where(display: true) }
  scope :positioned, -> { order(:position) }
end
