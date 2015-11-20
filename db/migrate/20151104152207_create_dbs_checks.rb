class CreateDbsChecks < ActiveRecord::Migration
  def change
    create_table :dbs_checks do |t|
      t.belongs_to :member_profile, index: true, foreign_key: true
      t.boolean :enhanced_dbs_completed_before, null: false
      t.string :previous_disclosure_number
      t.date :date_previous_dbs_completed
      t.string :company_completed_dbs_check
      t.boolean :unprotected_convictions, null: false
      t.boolean :unfiltered_convictions, null: false
      t.boolean :another_country_police_check, null: false
      t.boolean :suspended_or_under_investigation, null: false
      t.text :additional_information

      t.timestamps null: false
    end
  end
end
