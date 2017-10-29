class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :name_p, null: false
      t.text :full_name_p, null: false, unique: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
