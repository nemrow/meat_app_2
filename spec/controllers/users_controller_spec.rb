require 'spec_helper'

describe UsersController do

  context "create a new user" do
    before do
      post :create, :user => {:first_name => 'Jordan',
                              :last_name => 'Nemrow',
                              :email => 'nemrowj@gmail.com',
                              :password => 'password'}                        
    end

    it "should create user" do
      User.count.should == 1
    end

    it "should set correct fields for user" do
      User.last.first_name.should == 'Jordan'
      User.last.last_name.should == 'Nemrow'
      User.last.email.should == 'nemrowj@gmail.com'
    end
  end

end
