class CreateMemberSubmissions < ActiveRecord::Migration
  def change
    create_table :member_submissions do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.boolean :health_information_accurate, null: false
      t.boolean :full_acknowledgement, null: false
      t.boolean :downloaded_handbook, null: false

      t.timestamps null: false
    end
  end
end
