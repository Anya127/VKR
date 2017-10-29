class CreateRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :relations do |t|
      t.text :d_vocation_pu, null: false
      t.references :post, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
