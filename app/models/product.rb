include ApplicationHelper

class Product < ActiveRecord::Base
  attr_accessible :name, :supplier_id

  belongs_to :supplier
  has_many :inventories
  has_many :orders

  def get_in_transit(date)
    date = date_formatted(date) if date.kind_of?(Time)
    'WIP'
  end

  def get_order(date)
    date = date_formatted(date) if date.kind_of?(Time)
    order = orders.where("order_date_string = '#{date}'").first
    order ? order.quantity : 'NA'
  end

  def get_inventory(date)
    date = date_formatted(date) if date.kind_of?(Time)
    inventory = inventories.where("date_string = '#{date}'").first
    inventory ? inventory.quantity : 'NA'
  end
end
