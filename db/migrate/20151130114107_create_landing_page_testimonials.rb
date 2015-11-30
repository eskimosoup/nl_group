class CreateLandingPageTestimonials < ActiveRecord::Migrationtrue
  def change
    create_table :landing_page_testimonials do |t|
      t.belongs_to :landing_page, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :testimonial, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
