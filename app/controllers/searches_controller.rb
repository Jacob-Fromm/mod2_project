class SearchesController < ApplicationController
    include ParkService
    before_action :client
    
    def client
        @client ||= ParkService::Client.new
    end

    def show
        if @client.parks.find {|park| park["fullName"] == params[:park_name]}
            park_code = @client.parks.each.select {|park| park["fullName"] == params[:park_code]}[0]["parkCode"]
            @park = @client.park(park_code)[0]
        else
            flash[:error] = "Please enter a valid park name"
            render :new
        end
        
        
        
    end

end
