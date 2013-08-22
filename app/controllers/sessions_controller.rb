class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @errors = params[:errors]
      @user = User.new
      @page_header = 'Sign In'
    end
  end

  def create
    if user = User.find_by_email(params[:user][:email])
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        p user.errors
        redirect_to login_path(:errors => {'password' => ['password does not match']})
      end
    else
      redirect_to login_path(:errors => {'email' => ['user not found']})
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
