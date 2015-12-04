class AddSlugToAdditionalRow < ActiveRecord::Migration
  def change
    add_column :additional_rows, :slug, :string, unique: true
    add_column :additional_rows, :suggested_url, :string, unique: true
  end
end
