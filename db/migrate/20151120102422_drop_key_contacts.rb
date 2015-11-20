class DropKeyContacts < ActiveRecord::Migration
  def up
    remove_reference :member_profiles, :key_contact, index: true, foreign_key: { on_delete: :cascade }
    drop_table :key_contacts
  end

  def down
    create_table :key_contacts do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone_number
      t.string :mobile_number

      t.timestamps null: false
    end
    add_reference :member_profiles, :key_contact, index: true, foreign_key: { on_delete: :cascade }
  end
end
