class ParksController < ApplicationController
    include ParkService
    before_action :client
    
    def client
        @client ||= ParkService::Client.new
    end
    
    def index
        @parks = @client.parks 

    end

    def new

    end

    def show
       
    end

    private

    def park_code
    end

    def set_params
        params.require(:park).permit!
    end
end

