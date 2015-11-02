class CreateEmergencyContacts < ActiveRecord::Migration
  def change
    create_table :emergency_contacts do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.string :full_name, null: false
      t.string :email_address, null: false
      t.string :mobile_number, null: false
      t.string :relationship

      t.timestamps null: false
    end
  end
end
