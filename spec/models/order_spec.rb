require 'spec_helper'

describe Order do
  let (:company) { FactoryGirl.create(:company) }
  let (:supplier) { FactoryGirl.create(:supplier) }
  let (:product) { FactoryGirl.create(:product) }

  before do
    @order = FactoryGirl.create(:order)
  end

  it "should create an order" do 
    Order.count.should == 1
  end 

  it "should set order_date field to today" do
    date_formatted(Order.last.order_date).should == date_formatted(Time.now)
  end

  it "should set delivery_date according to the delivery_days" do
    'pending'
  end

  it "should assign order to company" do
    company.orders << @order
    company.orders.last.should == @order
  end

  it "should assign order to supplier" do
    supplier.orders << @order
    supplier.orders.last.should == @order
  end

  it "should assign order to product" do
    product.orders << @order
    product.orders.last.should == @order
  end

  it { should belong_to(:company) }
  it { should belong_to(:supplier) }
  it { should belong_to(:product) }
end
