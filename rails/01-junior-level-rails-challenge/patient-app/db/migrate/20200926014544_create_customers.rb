class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :location
      t.integer :partner_id
    end
  end
end
