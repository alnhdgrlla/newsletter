class ChangeTemplate < ActiveRecord::Migration[6.0]
  def change
    rename_column :templates, :temp_name, :temp_name
    remove_column :templates, :sub_name, :string
    remove_column :templates, :temp_content, :string
  end
end
