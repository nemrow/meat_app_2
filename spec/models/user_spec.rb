require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create(:user)
  end

  it "should add a user to the database" do
    User.count.should == 1
  end

  it "should set proper fields to the user" do
    User.last.first_name == @user.first_name
    User.last.last_name == @user.last_name
    User.last.email == @user.email
  end

  it "should authenticate user" do
    User.last.authenticate('password').should == @user
  end

  it { should have_many(:companies) }
end
