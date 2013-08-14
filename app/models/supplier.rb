class Supplier < ActiveRecord::Base
  attr_accessible :company_id, :name

  belongs_to :company
  has_many :products
  has_many :order_days
  has_many :orders
  has_many :inventories
end
