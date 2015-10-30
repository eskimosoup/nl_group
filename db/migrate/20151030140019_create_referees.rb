class CreateReferees < ActiveRecord::Migration
  def change
    create_table :referees do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.string :name, null: false
      t.string :position, null: false
      t.string :contact_number, null: false
      t.string :fax_number
      t.string :email_address, null: false
      t.text :postal_address, null: false
      t.boolean :contact_referee, default: true

      t.timestamps null: false
    end
  end
end
