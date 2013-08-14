require 'spec_helper'

describe Company do
  let (:user) { FactoryGirl.create(:user) }

  before do
    @company = FactoryGirl.create(:company)
  end

  it "should add a new company" do
    Company.count.should == 1
  end

  it "should set company fields" do 
    Company.last.name.should == @company.name
  end

  it "should assign company to user" do
    user.companies << @company
    user.companies.count.should == 1
  end
  
  it { should have_many(:users) }
end
