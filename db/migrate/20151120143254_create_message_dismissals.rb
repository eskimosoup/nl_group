class CreateMessageDismissals < ActiveRecord::Migration
  def change
    create_table :message_dismissals do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }, null: false
      t.belongs_to :admin_message, index: true, foreign_key: { on_delete: :cascade }, null: false

      t.timestamps null: false
    end
  end
end
