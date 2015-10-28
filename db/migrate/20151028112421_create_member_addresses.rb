class CreateMemberAddresses < ActiveRecord::Migration
  def change
    create_table :member_addresses do |t|
      t.belongs_to :member_profile, index: true, foreign_key: { on_delete: :cascade }
      t.string :address, null: false
      t.date :lived_here_from, null: false
      t.date :lived_here_to
      t.boolean :current, default: false

      t.timestamps null: false
    end
  end
end
