class CreateTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :templates do |t|
      t.string :temp_name
      t.text :content
      t.string :sub_name
      t.string :temp_content
      t.references :spam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
