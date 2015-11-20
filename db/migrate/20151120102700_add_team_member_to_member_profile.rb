class AddTeamMemberToMemberProfile < ActiveRecord::Migration
  def change
    add_reference :member_profiles, :team_member, index: true, foreign_key: { on_delete: :nullify }
  end
end
