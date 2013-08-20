include ApplicationHelper

class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :users, :through => :user_companies
  has_many :user_companies
  has_many :suppliers
  has_many :orders
  has_many :inventories

  def get_ordering_suppliers(day)
    suppliers.select do |supplier|
      supplier.get_ordering_days.include?(day_of_week(day))
    end
  end
end
