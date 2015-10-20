class AddStyleToContentBlock < ActiveRecord::Migration
  def change
    add_column :additional_blocks, :style, :string
    remove_column :additional_rows, :style, :string
  end
end
