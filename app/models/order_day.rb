class OrderDay < ActiveRecord::Base
  attr_accessible :day, :duration, :supplier_id
  validates :duration, :numericality => {:message => "Duration must be a number"}
  belongs_to :supplier
end
