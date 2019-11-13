class AddForeignKeyToTemplate < ActiveRecord::Migration[6.0]
  def change
    add_reference :templates, :manager, foreign_key: true
  end
end
