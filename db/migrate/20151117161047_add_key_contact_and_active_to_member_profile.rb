class AddKeyContactAndActiveToMemberProfile < ActiveRecord::Migration
  def change
    add_reference :member_profiles, :key_contact, index: true, foreign_key: { on_delete: :cascade }
    add_column :member_profiles, :active, :boolean, default: false
  end
end
