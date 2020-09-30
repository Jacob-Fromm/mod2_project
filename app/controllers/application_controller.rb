class ApplicationController < ActionController::Base
#   before_action :authorized
#   helper_method :logged_in?

    # include NPS
    # before_action :client
    
    # def client
    #     @client ||= NPS::Client.new
    # end

#   def home
#     @current_user = User.find_by(id: session[:username])
#   end

#   def set_current_user
#     @current_user = User.find_by(id: session[:username])
#   end

#   def logged_in?
#     !!set_current_user
#   end




  def authorized
    # redirect_to '/login' unless logged_in?
    redirect_to login_path unless logged_in?
  end

end
