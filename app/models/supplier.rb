include ApplicationHelper

class Supplier < ActiveRecord::Base
  attr_accessible :company_id, :name

  belongs_to :company
  has_many :products
  has_many :order_days
  has_many :orders
  has_many :inventories

  def get_or_create_todays_suppliers_inventories
    inventories = []
    products.each do |product|
      inventory = Inventory.includes(:product).find_or_create_by_date_string_and_product_id(date_formatted(Time.now), product.id)
      self.inventories << inventory
      self.company.inventories << inventory
      inventories << inventory
    end
    inventories
  end

  def get_or_create_todays_suppliers_orders
    orders = []
    products.each do |product|
      inventory = Order.includes(:product).find_or_create_by_order_date_string_and_product_id(date_formatted(Time.now), product.id)
      self.orders << inventory
      self.company.orders << inventory
      orders << inventory
    end
    orders
  end
end
