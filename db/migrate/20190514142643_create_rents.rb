class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.date :start_date_rent, null: false
      t.date :end_date_rent, null: false

      t.timestamps
    end
  end
end
