class AddSuggestedUrlToAudience < ActiveRecord::Migration
  def change
    add_column :audiences, :suggested_url, :string, null: true
    add_column :audiences, :slug, :string, null: true
  end
end
