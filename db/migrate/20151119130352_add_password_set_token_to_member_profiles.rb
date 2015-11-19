class AddPasswordSetTokenToMemberProfiles < ActiveRecord::Migration
  def change
    add_column :member_profiles, :password_set_token, :string
  end
end
