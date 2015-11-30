class CreateWhyWorkReasons < ActiveRecord::Migration
  def change
    create_table :why_work_reasons do |t|
      t.belongs_to :landing_page, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :landing_page_why_work, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
