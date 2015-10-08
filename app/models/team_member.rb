class TeamMember < ActiveRecord::Base
  validates :forename, :surname, :role, presence: true
end
