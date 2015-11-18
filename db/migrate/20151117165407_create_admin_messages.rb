class CreateAdminMessages < ActiveRecord::Migration
  def change
    create_table :admin_messages do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
