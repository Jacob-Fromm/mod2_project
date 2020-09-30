class ParksController < ApplicationController

    include ParkService
    before_action :client
    
    def client
        @client ||= ParkService::Client.new
    end
    
    def index
        @parks = Park.all
    end
    
    def show
        @park = Park.find(params[:id])
    end

    private

    def set_params
        params.require(:park).permit!
    end



end

