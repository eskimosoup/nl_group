class CreateJobLocations < ActiveRecord::Migration
  def change
    create_table :job_locations do |t|
      t.belongs_to :job, index: true, foreign_key: { on_delete: :cascade }
      t.string :country
      t.string :country_coe
      t.string :region
      t.string :region_code
      t.string :city
      t.string :zip_code
      t.boolean :telecommuting

      t.timestamps null: false
    end
  end
end
