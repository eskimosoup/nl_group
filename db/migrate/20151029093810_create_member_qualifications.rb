class CreateMemberQualifications < ActiveRecord::Migration
  def change
    create_table :member_qualifications do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.string :register
      t.string :registration_number
      t.date :expiry_date
      t.integer :afc_band
      t.text :additional_qualifications

      t.timestamps null: false
    end
  end
end
