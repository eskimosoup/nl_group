class CreateImmunisationHistories < ActiveRecord::Migration
  def change
    create_table :immunisation_histories do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.boolean :had_triple_vaccination, null: false
      t.date :triple_vaccination_date
      t.boolean :had_polio_vaccination, null: false
      t.date :polio_vaccination_date
      t.boolean :had_hepatitis_b_vaccination, null: false
      t.date :hepatitis_b_vaccination_date
      t.date :hep_b_course_1_date
      t.date :hep_b_course_2_date
      t.date :hep_b_course_3_date
      t.date :hep_b_booster_1_date
      t.date :hep_b_booster_2_date
      t.date :hep_b_booster_3_date
      t.boolean :role_involves_epps, null: false

      t.timestamps null: false
    end
  end
end
