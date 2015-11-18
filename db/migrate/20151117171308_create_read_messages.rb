class CreateReadMessages < ActiveRecord::Migration
  def change
    create_table :read_messages do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :admin_message, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
