class ParksController < ApplicationController
    include ParkService
    before_action :client
    
    def client
        @client ||= ParkService::Client.new
    end
    
    def index
        @parks = @client.parks
    end
end

