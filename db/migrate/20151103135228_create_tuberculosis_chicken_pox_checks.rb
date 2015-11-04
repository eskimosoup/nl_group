class CreateTuberculosisChickenPoxChecks < ActiveRecord::Migration
  def change
    create_table :tuberculosis_chicken_pox_checks do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.boolean :lived_continuously, null: false
      t.boolean :bcg_vaccination, null: false
      t.date :vaccination_date
      t.boolean :cough, null: false
      t.boolean :weight_loss, null: false
      t.boolean :fever, null: false
      t.boolean :had_tb, null: false
      t.text :additional_information
      t.boolean :had_chicken_pox, null: false
      t.date :chicken_pox_date

      t.timestamps null: false
    end
  end
end
