include ApplicationHelper

class Product < ActiveRecord::Base
  attr_accessible :name, :supplier_id

  validates :name, :presence => {:message => 'Product must have a name'}

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

  def get_order_suggestion(date, history = 3)
    past_dates = (1..history).map {|num| date_formatted(date - num.weeks)}
    past_totals = past_dates.map do |date|
      if order_quantity = self.orders.where("order_date_string = '#{date}'").first
        order_quantity = order_quantity.quantity
        transit_quantity = self.get_in_transit(date_from_formatted_string(date))
        inventory_quantity = self.inventories.where("date_string = '#{date}'").first.quantity
        order_quantity + transit_quantity + inventory_quantity
      end
    end
    weeks_active = 0
    full_past_sum = past_totals.inject(0) do |sum, past_total|
      if past_total
        weeks_active += 1
        sum + past_total
      else
        sum
      end
    end
    average_history_total = weeks_active != 0 ? full_past_sum / weeks_active : 'NA'
    todays_inventory = self.inventories.where("date_string = '#{date_formatted(date)}'").first.quantity
    todays_in_transit = self.get_in_transit(date)
    average_history_total - (todays_inventory - todays_in_transit)
  end
end
