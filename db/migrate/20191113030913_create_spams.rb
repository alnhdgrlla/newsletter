class CreateSpams < ActiveRecord::Migration[6.0]
  def change
    create_table :spams do |t|
      t.string :name
      t.references :manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
