class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.text :number_c, null: false
      t.date :d_conclusion_c, null: false
      t.date :d_expiration_c, null: false
      t.float :stavka, null: false
      t.text :vocation_c, null: false
      t.text :special_conditions
      t.references :worker, foreign_key: true
      t.references :relation, foreign_key: true
      t.index [:number_c, :d_conclusion_c], unique: true 

      t.timestamps
    end
  end
end
