class CreatePaymentDeclarations < ActiveRecord::Migration
  def change
    create_table :payment_declarations do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.string :payment_methodology, null: false
      t.boolean :limit_working_week, null: false

      t.timestamps null: false
    end
  end
end
