class NationalParksController < ApplicationController
    

    def index
       @tag = query.fetch(:tags, "all")
       @parks, @errors = NPS::NationalPark.random(query)
       byebug

    end

    def show
        @park = NPS::NationalPark.find(params[park_code])
    end
    
    private

    def query
        params.fetch(:query, {})
    end
end
