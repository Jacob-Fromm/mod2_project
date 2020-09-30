class UsersController < ApplicationController

  skip_before_action :authorized, only: [:login, :home, :handle_login, :new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params(:name, :email, :password))
    user.email = user.email.downcase
    if user.valid?
      user.save
      flash[:success] = "#{user.email}"
      redirect_to login_path
    else  
      flash[:message] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    @user.update(user_params(:name, :password))
    if @user.valid?
      redirect_to home_path
    else  
      flash[:message] = user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    
     @current_user.destroy
    redirect_to login_path
  end

  def login

  end
  
  def handle_login
    @user = User.find_by(email: params[:email].downcase)
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

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
