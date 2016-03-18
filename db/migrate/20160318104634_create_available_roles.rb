class CreateAvailableRoles < ActiveRecord::Migration
  def change
    create_table :available_roles do |t|
      t.integer :position, null: true
      t.string :title, null: false
      t.string :rates_of_pay, null: false
      t.string :workable_link, null: true
      t.boolean :display, default: true, null: true

      t.timestamps null: false
    end
  end
end
