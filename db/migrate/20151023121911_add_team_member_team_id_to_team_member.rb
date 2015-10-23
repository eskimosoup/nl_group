class AddTeamMemberTeamIdToTeamMember < ActiveRecord::Migration
  def change
    add_reference :team_members, :team_member_team, index: true, foreign_key: true
  end
end
