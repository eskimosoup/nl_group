class CreateBasicMedicalHistories < ActiveRecord::Migration
  def change
    create_table :basic_medical_histories do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_cascade: :delete }
      t.text :gp_address, null: false
      t.boolean :illness_affecting_work, default: false
      t.boolean :illness_caused_by_work, default: false
      t.boolean :require_assistance, default: false
      t.boolean :having_treatment, default: false
      t.text :treatment_clarification

      t.timestamps null: false
    end
  end
end
