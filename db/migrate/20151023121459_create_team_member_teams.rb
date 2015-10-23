class CreateTeamMemberTeams < ActiveRecord::Migration
  def change
    create_table :team_member_teams do |t|
      t.integer :position
      t.string :name, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
