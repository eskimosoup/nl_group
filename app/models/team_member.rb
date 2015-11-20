class TeamMember < ActiveRecord::Base

  mount_uploader :image, TeamMemberUploader
  validates :forename, :surname, :role, :team_member_team_id, presence: true
  belongs_to :team_member_team

  scope :displayed, -> { where(display: true) }
  scope :positioned, -> { order(:position) }

  def full_name
    [forename, surname].join(" ")
  end
end
