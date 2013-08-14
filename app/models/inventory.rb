class Inventory < ActiveRecord::Base
  attr_accessible :company_id, :date, :product_id, :quantity, :supplier_id

  belongs_to :company
  belongs_to :supplier
  belongs_to :product
end
