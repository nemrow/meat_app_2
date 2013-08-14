require 'spec_helper'

describe OrderDay do
  let (:supplier) { FactoryGirl.create(:supplier) }

  before do 
    @order_day = FactoryGirl.create(:order_day)
  end

  it "should create an order_day" do
    OrderDay.count.should == 1
  end

  it "should set fields" do
    OrderDay.last.day.should == @order_day.day
    OrderDay.last.duration.should == @order_day.duration
  end

  it "should assign order_day to supplier" do
    supplier.order_days << @order_day
    supplier.order_days.last.should == @order_day
  end

  it { should belong_to(:supplier) }
end
