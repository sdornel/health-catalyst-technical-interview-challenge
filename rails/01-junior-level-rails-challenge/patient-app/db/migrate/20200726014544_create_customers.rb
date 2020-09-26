class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    # create_table :customers, id: false, { :primary_key => :customer_external_id } do |t|
    # create_table :customers, id: false, primary_key: :customer_external_id do |t|
    create_table :customers do |t|
      # t.integer :customer_external_id#, auto_increment: true
      t.string :name
      t.string :location
      t.integer :partner_id
    end
  end
end
# EXECUTE " INCREMENT BY 1 START WITH 1"
# ActiveRecord::Base.connection.execute("ALTER SEQUENCE table_name_id_seq RESTART WITH 1")
# customer_external_id