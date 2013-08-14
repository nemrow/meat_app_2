class UsersController < ApplicationController
  def create
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user, :notices => [Messages.welcome(user.first_name)])
    else
      redirect_to new_user_path(:errors => user.errors.messages)
    end
  end

  def new
    @errors = params[:errors]
    @user = User.new
  end

  def show
    user = User.find(params[:id])
    if current_user && current_user == user 
      if current_user.companies.count > 1
        redirect_to company_path(current_user.companies.first)
      else
        redirect_to new_company_path(:notices => params[:notices])
      end
    else
      redirect_to root_path(:errors => {'bad permission' => [Messages.not_owner]})
    end
  end
end
