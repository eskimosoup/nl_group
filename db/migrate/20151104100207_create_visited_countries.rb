class CreateVisitedCountries < ActiveRecord::Migration
  def change
    create_table :visited_countries do |t|
      t.belongs_to :tuberculosis_chicken_pox_check, index: true, foreign_key: { on_cascade: :delete }
      t.string :name, null: false
      t.integer :duration, null: false
      t.integer :from_year, null: false, limit: 2
      t.integer :to_year, null: false, limit: 2

      t.timestamps null: false
    end
  end
end
