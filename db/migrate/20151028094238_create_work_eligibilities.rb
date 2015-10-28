class CreateWorkEligibilities < ActiveRecord::Migration
  def change
    create_table :work_eligibilities do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.string :passport_number, null: false
      t.date :expiry_date, null: false
      t.string :nationality
      t.boolean :hold_eu_passport, default: true
      t.string :proof_of_right_to_work

      t.timestamps null: false
    end
  end
end
