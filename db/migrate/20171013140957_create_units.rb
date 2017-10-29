class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.text :name_u, null: false
      t.text :full_name_u, null: false, unique:true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
