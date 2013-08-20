include ApplicationHelper

class Product < ActiveRecord::Base
  attr_accessible :name, :supplier_id

  belongs_to :supplier
  has_many :inventories
  has_many :orders

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

  def get_in_transit(date)
    total_in_transit = orders.inject(0) do |sum, order|
      if  date_from_formatted_string(order.delivery_date_string) > date.beginning_of_day() &&
          date_from_formatted_string(order.order_date_string) < date.beginning_of_day()
        sum + order.quantity.to_i
      else
        sum
      end
    end
    total_in_transit
  end
end
