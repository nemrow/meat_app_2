include ApplicationHelper

class Supplier < ActiveRecord::Base
  attr_accessible :company_id, :name

  validates :name, :presence => {:message => 'Supplier must have a name'}

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
      product.inventories << inventory
      inventories << inventory
    end
    inventories
  end

  def get_or_create_todays_suppliers_orders
    orders = []
    products.each do |product|
      order = Order.includes(:product).find_or_create_by_order_date_string_and_product_id(date_formatted(Time.now), product.id)
      self.orders << order
      self.company.orders << order
      product.orders << order
      order.set_delivery_date
      orders << order
    end
    orders
  end

  def get_ordering_days
    order_days.map {|day| day.day }
  end
end
