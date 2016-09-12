class CreateAudiences < ActiveRecord::Migration
  def change
    create_table :audiences do |t|
      t.string :name, index: { unique: true }

      t.timestamps null: false
    end
  end
end
