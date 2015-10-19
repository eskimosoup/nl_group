class CreateAdditionalTitles < ActiveRecord::Migration
  def change
    create_table :additional_titles do |t|
      t.belongs_to :additional_block, index: true, foreign_key: true
      t.string :content
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
