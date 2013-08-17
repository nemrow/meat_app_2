class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.string :order_date_string
      t.string :delivery_date_string
      t.integer :product_id
      t.integer :supplier_id
      t.integer :company_id

      t.timestamps
    end
  end
end
