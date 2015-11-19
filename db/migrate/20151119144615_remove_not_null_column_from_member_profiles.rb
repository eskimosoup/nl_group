class RemoveNotNullColumnFromMemberProfiles < ActiveRecord::Migration
  def change
    change_column_null(:member_profiles, :password_digest, true)
  end
end
