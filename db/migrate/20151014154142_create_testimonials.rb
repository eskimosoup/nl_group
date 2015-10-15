class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :role, null: false
      t.string :image
      t.text :content, null: false
      t.text :video_embed_code
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
