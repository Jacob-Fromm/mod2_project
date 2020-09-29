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
        if @current_user.valid?
            @trip = @current_user.trips.create(trip_params)
            redirect_to home_path
        end

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
        params.require(:trip).permit(:user_id, :park_id)
    end
end
