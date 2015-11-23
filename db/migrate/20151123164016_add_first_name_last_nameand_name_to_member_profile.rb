class AddFirstNameLastNameandNameToMemberProfile < ActiveRecord::Migration
  def change
    add_column :member_profiles, :first_name, :string
    add_column :member_profiles, :last_name, :string
    add_column :member_profiles, :full_name, :string
  end
end
