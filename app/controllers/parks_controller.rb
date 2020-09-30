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
        if @client.parks.find {|park| park["fullName"] == @park.park_name}
            park_code = @client.parks.each.select {|park| park["fullName"] == @park.park_name}[0]["parkCode"]
            @park_api = @client.park(park_code)[0]
            
            @park_campgrounds = @client.park_campgrounds(park_code)
            @park_amenities = @client.park_amenities(park_code).map {|amenity| amenity["name"] }
            
        end
    
    end

    private

    def set_params
        params.require(:park).permit!
    end
end

