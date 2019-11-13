class RemoveForeignKeyFromTemplate < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :templates, :managers
    remove_index :templates, :manager_id
    remove_reference :templates, :manager
  end
end
