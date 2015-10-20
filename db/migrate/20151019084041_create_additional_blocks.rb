class CreateAdditionalBlocks < ActiveRecord::Migration
  def change
    create_table :additional_blocks do |t|
      t.integer :position
      t.string :name
      t.string :classes
      t.boolean :display, default: true
      t.belongs_to :additional_row, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
