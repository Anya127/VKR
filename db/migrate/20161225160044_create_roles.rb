class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :info
      t.text :full_info

      t.timestamps
    end
  end
end
