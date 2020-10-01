class TripsController < ApplicationController
    before_action :find_trip, only: [:show, :edit, :update, :destroy]
    
    def show
    end

    def new
        @trip = Trip.new(user_id: @current_user)
        @trip.save
    end

    def create
        @trip = @current_user.trips.create(trip_params)
        if @trip.valid?
            redirect_to home_path
        else
            flash[:trip_errors] = @trip.errors.full_messages
            redirect_to new_trip_path
        end
    end

    def edit
    end

    def update
        @trip.update(trip_params)
        
        if @trip.valid?
            redirect_to home_path
        else
            redirect_to edit_trip_path
        end
    end
    
    def destroy
        @trip = @current_user.trips.find(params[:id])
        @trip.destroy
        redirect_to home_path
       
            
    
    end
    private

    def trip_params
        params.require(:trip).permit(:user_id, :park_id, :trip_start_date, :trip_end_date)
    end

    def find_trip
         @trip = Trip.find(params[:id])
    end
end
