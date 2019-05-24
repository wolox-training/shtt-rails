class CreateWprofMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :wprof_methods do |t|
      t.string :transaction_id
      t.float :total_time
      t.datetime :start_dt
      t.datetime :end_dt
      t.string :method

      t.timestamps
    end
    add_index :wprof_methods, :transaction_id
    add_index :wprof_methods, :method
  end
end
