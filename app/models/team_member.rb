class TeamMember < ActiveRecord::Base

  mount_uploader :image, TeamMemberUploader
  validates :forename, :surname, :role, presence: true

end
