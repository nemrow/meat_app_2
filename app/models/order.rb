include ApplicationHelper

class Order < ActiveRecord::Base
  attr_accessible :company_id, :delivery_date_string, :order_date_string, :product_id, :quantity, :supplier_id

  belongs_to :supplier
  belongs_to :product
  belongs_to :company

  before_save :set_order_date

  def set_order_date
    self.order_date_string = date_formatted(Time.now) if !order_date_string
  end

  def set_delivery_date
    todays_order_day_set = self.supplier.order_days.select do |day|
      day.day == day_of_week(Time.now)
    end
    days_from_now = todays_order_day_set.first.duration
    update_attributes(:delivery_date_string => date_formatted(Time.now + days_from_now.days))
  end

  def self.update_from_order_form(form_hash)
    form_hash.each do |order_id, quantity|
    order = self.find(order_id)
    order.update_attributes(quantity)
    end
  end
end
