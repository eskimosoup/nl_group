class RenameCountryCoeOnJobLocations < ActiveRecord::Migration
  def change
    rename_column :job_locations, :country_coe, :country_code
  end
end
