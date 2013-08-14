require 'spec_helper'

describe Product do
  let (:supplier) { FactoryGirl.create(:supplier) }

  before do
    @product = FactoryGirl.create(:product)
  end

  it "should create a product" do
    Product.count.should == 1
  end

  it "should set the correct fields" do 
    Product.last.name.should == @product.name
  end

  it "should assign the product to the supplier" do
    supplier.products << @product
    supplier.products.count.should == 1
  end
  
  it { should belong_to(:supplier) }
  it { should have_many(:orders) }
  it { should have_many(:inventories) }
end
