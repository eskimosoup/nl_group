class AddVisibileTitleToAdditionalRow < ActiveRecord::Migration
  def change
    add_column :additional_rows, :visible_title, :string
  end
end
