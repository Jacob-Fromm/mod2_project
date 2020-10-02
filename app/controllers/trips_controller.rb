class TripsController < ApplicationController
    # before_action :find_trip, only: [:show, :edit, :update, :destroy]
    
    def show
        @trip = Trip.find(params[:id])
    end

    def new
        @trip = Trip.new(user_id: @current_user)
        @trip.save
    end
    
    def create
        @trip = @current_user.trips.create(trip_params)
        if @trip.valid?
            drop_cookie
            redirect_to home_path
        else
            flash[:trip_errors] = @trip.errors.full_messages
            redirect_to new_trip_path
        end
    end

    def cookie
        @parktrip = Park.find_by(id: cookies[:park_id])
            if @current_user && @parktrip
        @trip = Trip.new(user_id: @current_user)
            end
   
    end

    

    def drop_cookie
        cookies.delete :park_id
    end


    def edit
        @trip = Trip.find(params[:id])

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

    # def handle_date
    #     a = '2020-10-02'
    #     b = a.split("-").map{|n| n.to_i}
    #     c = Date.new(b[0], b[1], b[2])
    # end


    private

    def trip_params
        params.require(:trip).permit(:user_id, :park_id, :trip_start_date, :trip_end_date)
    end

    def find_trip
        @trip = Trip.find(params[:id])
    end
end
