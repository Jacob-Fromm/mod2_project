class ApplicationController < ActionController::Base

  before_action :authorized
  skip_before_action :authorized, only: [:login, :home, :handle_login, :new, :create]

  def home
    @current_user = User.find_by(id: session[:username])
  end

  def set_current_user
    @current_user = User.find_by(id: session[:username])
  end

  def logged_in?
    !!set_current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
end
