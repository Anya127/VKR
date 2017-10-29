class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :name_c, null: false, unique: true
      t.text :full_name_c, null: false
      t.text :d_vocation_c, null: false

      t.timestamps
    end
  end
end
