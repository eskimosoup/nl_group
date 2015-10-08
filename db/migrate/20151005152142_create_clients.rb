class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :logo, null: false
      t.string :website, null: true
      t.boolean :display, default: true
      t.integer :position, default: 0

      t.timestamps null: false
    end
  end
end
