class CreateAccreditations < ActiveRecord::Migration
  def change
    create_table :accreditations do |t|
      t.string :name, null: false
      t.string :logo
      t.string :link
      t.integer :position, null: false, default: true, index: true
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
