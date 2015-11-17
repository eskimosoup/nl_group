class CreateKeyContacts < ActiveRecord::Migration
  def change
    create_table :key_contacts do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone_number
      t.string :mobile_number

      t.timestamps null: false
    end
  end
end
