require 'spec_helper'

describe Supplier do
  let (:company) { FactoryGirl.create(:company) }

  before do 
    @supplier = FactoryGirl.create(:supplier)
  end

  it "should add supplier" do
    Supplier.count.should == 1
  end

  it "should set proper fields to supplier" do
    Supplier.last.name.should == @supplier.name
  end

  it "should assign supplier to company" do
    company.suppliers << @supplier
    company.suppliers.count.should == 1
  end
end
