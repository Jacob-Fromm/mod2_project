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


    def get_campgrounds
        self.park_code = Park.find(park_code: params[:park_code])
        url = "https://developer.nps.gov/api/v1/campgrounds?parkCode=#{self.park_code}&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
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


    def get_thingstodo(p_code)
        self.park_code = Park.find(park_code: params[p_code])
        
        url = "https://developer.nps.gov/api/v1/thingstodo?parkCode=#{self.park_code}&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
        resp = RestClient.get(url)
        json_hash = JSON.parse(resp)
        activities = []
        json_hash.each do |data_key, value|
            if data_key["data"]
                value.each do |hash_keys|
                    activities << hash_keys["title"]
                end
            end
        end
        p activities
    end



    def get_events
        self.park_code = Park.find(park_code: params[:park_code])
        url = "https://developer.nps.gov/api/v1/events?parkCode=#{self.park_code}&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
        resp = RestClient.get(url)
        json_hash = JSON.parse(resp)
        events = []
        json_hash.each do |data_key, value|
            if data_key["data"]
                value.each do |hash_keys|
                    if hash_keys["title"] != nil 
                    events << hash_keys["title"]
                    end
                end
            end
        end
        if events.any?
            p events
        else
            p "No upcoming or current events happening at this time"
        end
    end


    def get_alerts
        self.park_code = Park.find(park_code: params[:park_code])
        url = "https://developer.nps.gov/api/v1/alerts?parkCode=#{self.park_code}&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
        resp = RestClient.get(url)
        json_hash = JSON.parse(resp)
        alerts = []
        desc = []
        json_hash.each do |data_key, value|
            if data_key["data"]
                value.each do |hash_keys|
                    if hash_keys["title"]
                        alerts << hash_keys["title"]
                    end
                    
                    if hash_keys["description"]
                        desc << hash_keys["description"]
                        
                    
                    end
                end
            end
        end
    
        p alerts
        p desc
    
    end


    
end
