class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.text :l_name, null: false
      t.text :f_name, null: false
      t.text :s_name
      t.text :inn, null: false
      t.text :passport, null: false
      t.text :snils, null: false
      t.date :d_bday, null: false
      t.index [:inn, :snils, :passport], unique: true 
      t.timestamps
    end
  end
end
