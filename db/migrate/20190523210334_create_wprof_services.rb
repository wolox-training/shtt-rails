class CreateWprofServices < ActiveRecord::Migration[5.1]
  def change
    create_table :wprof_services do |t|
      t.string :transaction_id
      t.float :total_time
      t.datetime :start_dt
      t.datetime :end_dt
      t.integer :code
      t.string :service_hostname
      t.string :request_uri

      t.timestamps
    end
    add_index :wprof_services, :transaction_id
    add_index :wprof_services, :code
    add_index :wprof_services, :service_hostname
    add_index :wprof_services, :request_uri
  end
end
