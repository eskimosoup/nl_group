class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.belongs_to :member_qualification, index: true, foreign_key: { on_delete: :cascade }
      t.string :name, null: false
      t.string :grade_obtained, null: false
      t.date :completed_date, null: false

      t.timestamps null: false
    end
  end
end
