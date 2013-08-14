class OrderDay < ActiveRecord::Base
  attr_accessible :day, :duration, :supplier_id

  belongs_to :supplier
end
