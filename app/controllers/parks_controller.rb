require 'uri'
require 'httparty'
require 'openssl'

class ParksController < ApplicationController

    def index
       @tag = query.fetch(:tags, "all")
       @parks, @errors = NPS::NationalPark.random(query)
    end

    def show
        @park = NPS::NationalPark.find(params[park_code])
    end
    
    
    private

    def query
        params.fetch(:query, {})
    end

    # def park_params
    #     params.require(:parks).permit!
    # end

    # def find_park

    # end
    
   
    # def parks
    #     response = RestClient.get("https://developer.nps.gov/api/v1/parks?&api_key=Kt4mt3BWhB06mkfBRFiOZdb6A3DUwH0CcKORnguX")
    #     json = JSON.parse(response)

    #     @parks = json["data"]
    # end
        
    












end
