class TripsController < ApplicationController
    def show
        @trip = Trip.find(params[:id])
    end

    def new
        
        # if @current_user
            @trip = Trip.new()
        # else 
        #     flash[:user_error] = "You are not logged in! You must be logged in to your account in order to book a trip!"
        #     # redirect_to login_user_path
        #     redirect_to login_path
        # end
    end
    
    def create
        # byebug
        # if @current_user.valid?
            @trip = @current_user.trips.create(trip_params)
            redirect_to home_path
        # end

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

    # def handle_date
    #     a = '2020-10-02'
    #     b = a.split("-").map{|n| n.to_i}
    #     c = Date.new(b[0], b[1], b[2])
    # end


    private

    def trip_params
        params.require(:trip).permit(:user_id, :park_id, :trip_start_date, :trip_end_date)
    end
end
