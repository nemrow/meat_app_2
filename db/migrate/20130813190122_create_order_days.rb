class CreateOrderDays < ActiveRecord::Migration
  def change
    create_table :order_days do |t|
      t.string :day
      t.integer :duration
      t.integer :supplier_id

      t.timestamps
    end
  end
end
