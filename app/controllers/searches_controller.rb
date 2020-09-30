class SearchesController < ApplicationController
    include ParkService
    before_action :client
    
    def client
        @client ||= ParkService::Client.new
    end

    def show
        park_code = @client.parks.each.select {|park| park["fullName"] == params["fullName"]}[0]["parkCode"]
        @park = @client.park(park_code)[0]
        
        
    end

end
