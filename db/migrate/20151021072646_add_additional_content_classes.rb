class AddAdditionalContentClasses < ActiveRecord::Migration
  def change
    change_column :additional_blocks, :display, :boolean, default: true
    add_column :additional_titles, :classes, :string
    add_column :additional_paragraphs, :classes, :string
    add_column :additional_buttons, :classes, :string
    add_column :additional_blocks, :has_title, :boolean, default: true
    add_column :additional_blocks, :has_paragraph, :boolean, default: true
    add_column :additional_blocks, :has_buttons, :boolean, default: false
  end
end
