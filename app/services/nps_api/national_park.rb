require "pry"
require_relative "./base.rb"
module NPS
    class NationalPark < Base
        attr_accessor :url,
            :fullName,
            :park_id,
            :parkCode,
            :description,
            :latitude,
            :longitude,
            :latLong,
            :acitivites,
            :topics,
            :states,
            :contacts,
            :entranceFees,
            :entrancePasses,
            :directionsInfo,
            :directionsURL,
            :operatingHours,
            :addresses,
            :images,
            :weatherInfo,
            :name,
            :designation,

        
        MAX_LIMIT = 100

        def self.random(query = {})
            response = Request.where("/parks/random", query.merge({number: MAX_LIMIT}))
            parks = response.fetch("parks", []).map {|park| NationalPark.new(park)}
            [parks, resposne[:errors]]
        end

        def self.find(park_code)
            response = Request.get("/parks?parkCode=#{park_code}")
            NationalPark.new(response)
        end

        binding.pry
    end
end