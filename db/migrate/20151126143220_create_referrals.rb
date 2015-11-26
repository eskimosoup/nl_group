class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.belongs_to :member_profile, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :referral_offer, null: false, index: true, foreign_key: true
      t.string :name, null: false
      t.string :email
      t.string :phone_number
      t.string :mobile_number

      t.timestamps null: false
    end
  end
end
