class AddTitleAndContentToAudience < ActiveRecord::Migration
  def change
    add_column :audiences, :title, :string, null: true
    add_column :audiences, :summary_text, :text, null: true
  end
end
