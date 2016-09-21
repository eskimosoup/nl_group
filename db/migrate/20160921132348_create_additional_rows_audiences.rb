class CreateAdditionalRowsAudiences < ActiveRecord::Migration
  def change
    create_table :additional_rows_audiences do |t|
      t.belongs_to :audience, index: true, foreign_key: true, null: false
      t.belongs_to :additional_row, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
