class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name, null: false
      t.string :file, null: false
      t.boolean :display, default: true
      t.integer :position, default: 0

      t.timestamps null: false
    end
  end
end
