class CreateBasicInformations < ActiveRecord::Migration
  def change
    create_table :basic_informations do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.string :title, null: false
      t.string :first_name, null: false
      t.string :middle_names
      t.string :last_name, null: false
      t.string :mobile_number, null: false
      t.string :home_number
      t.string :email_address, null: false
      t.date :using_current_name_since
      t.boolean :changed_name, default: false
      t.text :previous_names
      t.date :date_of_birth, null: false
      t.string :national_insurance_number, null: false
      t.string :where_heard
      t.string :referred_by

      t.timestamps null: false
    end
  end
end
