class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.date :order_date
      t.date :delivery_date
      t.integer :product_id
      t.integer :supplier_id
      t.integer :company_id

      t.timestamps
    end
  end
end
