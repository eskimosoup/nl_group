class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
