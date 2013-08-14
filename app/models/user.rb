class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password

  has_many :companies, :through => :user_companies
  has_many :user_companies

  validates :email, :uniqueness => {:message => 'email was taken'}, 
    :presence => {:message => 'email must be present'}
  validates :first_name, :presence => {:message => 'first name must be present'}
  validates :last_name, :presence => {:message => 'last name must be present'}

  has_secure_password
end
