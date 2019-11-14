class RemoveColumnFromTemplates < ActiveRecord::Migration[6.0]
  def change
    remove_column :templates, :temp_name, :string
  end
end
