class CreateReferralOffers < ActiveRecord::Migration
  def change
    create_table :referral_offers do |t|
      t.string :title, null: false
      t.text :details
      t.text :terms_and_conditions
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
