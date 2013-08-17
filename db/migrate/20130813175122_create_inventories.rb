class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.string :date_string
      t.integer :product_id
      t.integer :supplier_id
      t.integer :company_id

      t.timestamps
    end
  end
end
