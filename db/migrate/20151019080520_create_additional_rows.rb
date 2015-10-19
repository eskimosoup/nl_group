class CreateAdditionalRows < ActiveRecord::Migration
  def change
    create_table :additional_rows do |t|
      t.integer :position
      t.integer :additional_blocks_count
      t.string :name
      t.string :style
      t.integer :maximum_content_blocks
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
