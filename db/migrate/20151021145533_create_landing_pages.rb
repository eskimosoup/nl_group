class CreateLandingPages < ActiveRecord::Migration
  def change
    create_table :landing_pages do |t|
      t.string :name, null: false
      t.string :slug
      t.string :suggested_url

      t.timestamps null: false
    end
  end
end
