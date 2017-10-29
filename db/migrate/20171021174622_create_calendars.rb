class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.date :date_c
      t.boolean :is_output
      t.integer :year_c

      t.timestamps
    end
  end
end
