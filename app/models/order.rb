include ApplicationHelper

class Order < ActiveRecord::Base
  attr_accessible :company_id, :delivery_date_string, :order_date_string, :product_id, :quantity, :supplier_id

  belongs_to :supplier
  belongs_to :product
  belongs_to :company

  before_save :set_order_date

  def set_order_date
    self.order_date_string = date_formatted(Time.now)
  end

  def set_delivery_date
    # pending
  end
end
