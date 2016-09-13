class CreateJobRoles < ActiveRecord::Migration
  def change
    create_table :job_roles do |t|
      t.string :title, null: false
      t.text :summary
      t.string :link
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
