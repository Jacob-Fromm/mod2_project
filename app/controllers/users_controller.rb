class UsersController < ApplicationController

  def login

  end
  
  def handle_login
    @user = User.find_by(username: params[:username].downcase)
    if @user && @user.authenticate(params[:password])
      session[:username] = @user.id
      redirect_to home_path
    else
      # byebug
      flash[:message] = "Incorrect Username or Password"
      redirect_to login_path
    end
  end

  def logout
    session[:username] = nil
    redirect_to home_path
  end
end
