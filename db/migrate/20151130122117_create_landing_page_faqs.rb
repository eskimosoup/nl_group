class CreateLandingPageFaqs < ActiveRecord::Migration
  def change
    create_table :landing_page_faqs do |t|
      t.belongs_to :landing_page, index: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :frequently_asked_question, index: true, foreign_key: { on_delete: :cascade }landing_pages

      t.timestamps null: false
    end
  end
end
