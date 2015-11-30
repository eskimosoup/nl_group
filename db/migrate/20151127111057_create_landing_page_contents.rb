class CreateLandingPageContents < ActiveRecord::Migration
  def change
    create_table :landing_page_contents do |t|
      t.belongs_to :landing_page, index: true, foreign_key: true
      t.string :title, null: false
      t.text :content
      t.string :area
      t.boolean :display, default: true
      t.integer :position, null: false, default: 0
      t.timestamps null: false
    end

  end
end
