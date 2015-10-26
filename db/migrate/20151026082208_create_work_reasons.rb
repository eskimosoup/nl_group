class CreateWorkReasons < ActiveRecord::Migration
  def change
    create_table :work_reasons do |t|
      t.integer :position
      t.string :title
      t.string :image
      t.text :summary
      t.string :colour
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
