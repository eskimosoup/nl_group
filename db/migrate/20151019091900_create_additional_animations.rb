class CreateAdditionalAnimations < ActiveRecord::Migration
  def change
    create_table :additional_animations do |t|
      t.belongs_to :additional_block, index: true, foreign_key: true
      t.belongs_to :additional_title, index: true, foreign_key: true
      t.belongs_to :additional_paragraph, index: true, foreign_key: true
      t.belongs_to :additional_button, index: true, foreign_key: true
      t.string :animation_type
      t.integer :animation_delay, default: 0
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
