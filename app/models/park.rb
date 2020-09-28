require 'rest-client'
require 'json'

class Park < ApplicationRecord
     has_many :trips
     has_many :users, through: :trips

     # can get around limitations by getting limit 1-100, 2-200

    def get_park_codes
        url = "https://developer.nps.gov/api/v1/campgrounds?limit=100&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
        resp = RestClient.get(url)
        json_hash = JSON.parse(resp)
    
    
        park_codes_array = []
        json_hash.each do |data_key, value|
            if data_key["data"]
            value.each do |hash_keys|
            park_codes_array << hash_keys["parkCode"]
            park_codes_array.uniq!
            end
            
        end
        end

        park_codes_array
        
    end


    def get_campgrounds(p_code)
        url = "https://developer.nps.gov/api/v1/campgrounds?parkCode=#{p_code}&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
        resp = RestClient.get(url)
        json_hash = JSON.parse(resp)
        campgrounds = []
        json_hash.each do |data_key, value|
            if data_key["data"]
                
                value.each do |hash_keys|
                    
                    if hash_keys["operatingHours"]
                        hash_keys["operatingHours"].each do |key|
                            # binding.pry
                            if key["name"]
                            campgrounds << key["name"]
                            end
                        end
                        
                    end
                end
            end
        end
        
        p campgrounds

    end


    def get_activities(p_code)
        url = "https://developer.nps.gov/api/v1/thingstodo?parkCode=#{p_code}&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
        resp = RestClient.get(url)
        json_hash = JSON.parse(resp)


        
    
    
    
    end


    
end
