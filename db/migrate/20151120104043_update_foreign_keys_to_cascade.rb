class UpdateForeignKeysToCascade < ActiveRecord::Migration
  def change
    remove_foreign_key :basic_medical_histories, :member_profiles
    add_foreign_key :basic_medical_histories, :member_profiles, on_delete: :cascade
    remove_foreign_key :visited_countries, :tuberculosis_chicken_pox_checks
    add_foreign_key :visited_countries, :tuberculosis_chicken_pox_checks, on_delete: :cascade
    remove_foreign_key :dbs_checks, :member_profiles
    add_foreign_key :dbs_checks, :member_profiles, on_delete: :cascade
  end
end
