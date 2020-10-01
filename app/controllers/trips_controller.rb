class TripsController < ApplicationController

    
    def show
        @trip = Trip.find(params[:id])
    end

    def new
        if @current_user.valid? 
         
            @trip = Trip.new(user_id: @current_user)
        
        else
            flash[:user_error] = "You are not logged in! You must be logged in to your account in order to book a trip!"
            redirect_to login_user_path
            
        end
        
        
        
    end

    def create
        @parktrip = Park.find_by(id: cookies[:park_id])
        if @current_user.valid? 
            @trip = @current_user.trips.create(user_id: @current_user, park_id: @parktrip.id)
            @trip.save
            drop_cookie
            redirect_to home_path
            
        end
        byebug
        
        
    end


    def cookie
        @parktrip = Park.find_by(id: cookies[:park_id])
       if @current_user && @parktrip
        @trip = Trip.new(park_id: @parktrip)
        @trip.save
        
       end
       
       
    end

    def drop_cookie
        cookies.delete :park_id
    end
    
    def edit
        @trip = Trip.find(params[:id])

    end

    def update
        if @current_user.valid?
            @trip = @current_user.trips.update(trip_params)
            redirect_to home_path
        end
    end
    
    def destroy
        if @current_user.valid?
            @trip = @current_user.trips.find(params[:id])
            @trip.destroy
            redirect_to home_path
        end
            
    
    end
    
    
    
    private

    def trip_params
        params.require(:trip).permit(:user_id, :park_id, :trip_start_date, :trip_end_date)
    end
end
