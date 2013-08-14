class Product < ActiveRecord::Base
  attr_accessible :name, :supplier_id

  belongs_to :supplier
  has_many :inventories
  has_many :orders
end
