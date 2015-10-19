class CreateAdditionalButtons < ActiveRecord::Migration
  def change
    create_table :additional_buttons do |t|
      t.belongs_to :additional_block, index: true, foreign_key: true
      t.integer :position
      t.string :button_text
      t.string :button_link
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
