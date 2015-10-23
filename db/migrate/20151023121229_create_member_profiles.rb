class CreateMemberProfiles < ActiveRecord::Migration
  def change
    create_table :member_profiles do |t|
      t.string :email, null: false, index: true
      t.string :password_digest, null: false
      t.string :auth_token, index: true
      t.string :password_reset_token, index: true
      t.datetime :password_reset_sent_at

      t.timestamps null: false
    end
  end
end
