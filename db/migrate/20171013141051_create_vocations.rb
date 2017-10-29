class CreateVocations < ActiveRecord::Migration[5.0]
  def change
    create_table :vocations do |t|
      t.integer :type_v, null: false
      t.date :d_conclusion_v, null: false
      t.date :d_expiration_v, null: false
      t.boolean :is_real, null: false
      t.date :order_date, null: false
      t.text :order_number, null: false
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
