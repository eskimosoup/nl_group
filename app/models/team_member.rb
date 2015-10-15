class TeamMember < ActiveRecord::Base

  mount_uploader :image, TeamMemberUploader
  validates :forename, :surname, :role, presence: true

  scope :displayed, -> { where(display: true) }
  scope :positioned, -> { order(:position) }
end
