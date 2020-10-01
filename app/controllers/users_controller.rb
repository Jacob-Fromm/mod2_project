class UsersController < ApplicationController

  skip_before_action :authorized, only: [:login, :home, :handle_login, :new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params(:name, :email, :password, :password_confirmation))
    if user.valid?
      # user.save
      flash[:success] = "#{user.email}"
      redirect_to login_path
    else  
      if user.errors.messages.has_key?(:password)
        # pass name and email back to form 
        flash[:name] = "#{user.name}"
        flash[:email] = "#{user.email}"
      end
      flash[:message] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit 
    @user = User.find(params[:id])
    flash[:name] = "#{@user.name}"
    flash[:email] = "#{@user.email}"
  end

  def update 
    @user = User.find(params[:id])
    @user.update(user_params(:name, :password, :password_confirmation))    
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
