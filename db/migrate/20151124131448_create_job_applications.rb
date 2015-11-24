class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :job, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
    add_index :job_applications, [:member_profile_id, :job_id], unique: true
  end
end
