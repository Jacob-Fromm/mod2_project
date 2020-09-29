class TripsController < ApplicationController
    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end
    
    private

    def trip_params
        params.require(:trip).permit(:user_id, :park_id)
    end
end
