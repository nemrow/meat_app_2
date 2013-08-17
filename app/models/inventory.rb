include ApplicationHelper

class Inventory < ActiveRecord::Base
  attr_accessible :company_id, :date_string, :product_id, :quantity, :supplier_id, :quantity

  belongs_to :company
  belongs_to :supplier
  belongs_to :product

  before_save :set_date

  def set_date
    date_formatted(Time.now)
  end

  def self.update_from_inventory_form(form_hash)
    form_hash.each do |inventory_id, quantity|
    inventory = self.find(inventory_id)
    inventory.update_attributes(quantity)
    end
  end
end
