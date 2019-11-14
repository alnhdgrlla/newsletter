class RenameColumnOfTemplates < ActiveRecord::Migration[6.0]
  def change
    rename_column :templates, :temp_name, :temp_name
  end
end
