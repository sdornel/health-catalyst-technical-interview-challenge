class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :location
      t.integer :partner_id

      t.timestamps
    end
    execute "ALTER SEQUENCE customers_id_seq MINVALUE 1000 OWNED BY customers.id START WITH 1000 RESTART 1000;"

  end
end