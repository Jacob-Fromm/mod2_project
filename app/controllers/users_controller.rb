class UsersController < ApplicationController

  def show

  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.username = user.username.downcase
    if user.valid?
      user.save
      flash[:success] = "#{user.username}"
      redirect_to login_path
    else  
      flash[:message] = user.errors.full_messages
      redirect_to new_user_path
    end
  end


  def login

  end
  
  def handle_login
    @user = User.find_by(username: params[:username].downcase)
    if @user && @user.authenticate(params[:password])
      session[:username] = @user.id
      redirect_to home_path
    else
      flash[:message] = "Incorrect Username or Password"
      redirect_to login_path
    end
  end

  def logout
    session[:username] = nil
    redirect_to home_path
  end

  private 

  def user_params
    # switch to: permit(args) to limit access to :username
    params.require(:user).permit(:name, :username, :password)
  end
end
