class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :image
      t.text :profile
      t.string :email
      t.string :phone
      t.string :role, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
