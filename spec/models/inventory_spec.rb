require 'spec_helper'

describe Inventory do
  let (:company) { FactoryGirl.create(:company) }
  let (:supplier) { FactoryGirl.create(:supplier) }
  let (:product) { FactoryGirl.create(:product)}

  before do 
    @inventory = FactoryGirl.create(:inventory)
  end

  it "should create new inventory" do
    Inventory.count.should == 1
  end

  it "should set correct fields" do
    Inventory.last.quantity.should == @inventory.quantity
  end

  it "should assign inventory to company" do
    company.inventories << @inventory
    company.inventories.last.should == @inventory
  end

  it "should assign inventory to supplier" do
    supplier.inventories << @inventory
    supplier.inventories.last.should == @inventory
  end

  it "should assign inventory to product" do
    product.inventories << @inventory
    product.inventories.last.should == @inventory
  end

  it { should belong_to(:company) }
  it { should belong_to(:supplier) }
  it { should belong_to(:product) }
end
