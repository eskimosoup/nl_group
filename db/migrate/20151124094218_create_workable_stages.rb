class CreateWorkableStages < ActiveRecord::Migration
  def change
    create_table :workable_stages do |t|
      t.string :slug
      t.string :name, null: false
      t.string :kind, null: false
      t.integer :position, default: 0
      t.boolean :pull_candidates, default: false

      t.timestamps null: false
    end
  end
end
