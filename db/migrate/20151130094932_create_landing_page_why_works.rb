class CreateLandingPageWhyWorks < ActiveRecord::Migration
  def change
    create_table :landing_page_why_works do |t|
      t.string :title, null: false
      t.string :reason_type, null: false
      t.text :content, null: false
      t.boolean :display, default: true
      t.integer :position, default: 0

      t.timestamps null: false
    end
  end
end
