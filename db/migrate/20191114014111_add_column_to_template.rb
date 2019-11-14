class AddColumnToTemplate < ActiveRecord::Migration[6.0]
  def change
    add_column :templates, :name, :string
  end
end
