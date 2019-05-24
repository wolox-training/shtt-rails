class CreateWprofControllers < ActiveRecord::Migration[5.1]
  def change
    create_table :wprof_controllers do |t|
      t.string :transaction_id
      t.float :total_time
      t.datetime :start_dt
      t.datetime :end_dt
      t.integer :code
      t.string :controller
      t.string :url
      t.float :db_runtime

      t.timestamps
    end
    add_index :wprof_controllers, :transaction_id
    add_index :wprof_controllers, :code
    add_index :wprof_controllers, :url
  end
end
