class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :users, :through => :user_companies
  has_many :user_companies
  has_many :suppliers
  has_many :orders
  has_many :inventories
end
