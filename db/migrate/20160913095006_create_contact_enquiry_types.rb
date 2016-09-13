class CreateContactEnquiryTypes < ActiveRecord::Migration
  def change
    create_table :contact_enquiry_types do |t|
      t.string :enquiry_type, null: false, index: { unique: true }
      t.boolean :display, null: false, default: true

      t.timestamps null: false
    end
  end
end
