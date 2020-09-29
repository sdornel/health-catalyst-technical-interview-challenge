class CreateExports < ActiveRecord::Migration[6.0]
  def change
    create_table :exports do |t|
      
      t.string :export_status, :default => "Pending"
      
      t.integer :number_records
      
      t.timestamps

      t.datetime :export_ended
      t.float :export_duration_in_mins

      t.integer :customer_id
      t.integer :partner_id
    end
  end
end