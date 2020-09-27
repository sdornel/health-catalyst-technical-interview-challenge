class CreateExports < ActiveRecord::Migration[6.0]
  def change
    create_table :exports do |t|
      
      t.string :export_status, :default => "Pending"
      
      t.integer :number_records
      
      
      t.timestamps
      # t.datetime :created_at

      t.datetime :export_ended
      t.float :export_duration_in_mins
    end
  end
end

# TODO: 
# - An export should have a start time, end time, duration, status, and the associated 
# customer or partner (that the export was created for)

# change partner, customer, and export models to reflect this
# move patient csv exporting to both customer and partner


