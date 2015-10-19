class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :workable_id
      t.string :full_title
      t.string :shortcode
      t.string :code
      t.string :state
      t.string :department
      t.string :url
      t.string :application_url
      t.string :shortlink
      t.datetime :workable_created_at

      t.timestamps null: false
    end
  end
end
