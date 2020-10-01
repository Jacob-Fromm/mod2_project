require 'rest-client'
require 'json'

class Park < ApplicationRecord

#     include ParkService

     has_many :trips
     has_many :users, through: :trips

     # can get around limitations by getting limit 1-100, 2-200
     # self.park_code = Park.find(park_code: params[:park_code])

    

    def get_campgrounds
        
        url = "https://developer.nps.gov/api/v1/campgrounds?parkCode=#{self.park_code}&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
        resp = RestClient.get(url)
        json_hash = JSON.parse(resp)
        campgrounds = []
        json_hash.each do |data_key, value|
            if data_key["data"]
                
                value.each do |hash_keys|
                    
                    if hash_keys["operatingHours"]
                        hash_keys["operatingHours"].each do |key|
                            
                            if key["name"]
                            campgrounds << key["name"]
                            end
                        end
                        
                    end
                end
            end
        end
        if campgrounds.any?
             campgrounds
        else
            campgrounds << "There are no campgrounds at this site"
        end
         campgrounds

    end


    def get_thingstodo
        
        
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
        if activities.any?
            activities
        else
        activities << "No featured activities at this time, but there is so much fun to be had!"
        end
        activities
    end



    def get_events
        
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
            events
        else
            events << "No upcoming or current events happening at this time"
        end
         events 
    end


    def get_alerts
        
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
    
        alerts
        desc
    
    end

    def get_times
        url = "https://developer.nps.gov/api/v1/parks?parkCode=#{self.park_code}&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
        resp = RestClient.get(url)
        json_hash = JSON.parse(resp)
        normal_hours = []
        exception_hours = []
        json_hash.each do |data_key, value|
            if data_key["data"]
                value.each do |hash_keys, hash_v|
                    if hash_keys["operatingHours"]
                        
                        hash_v[0].each do |i_h|
                            normal_hours << i_h["standardHours"]
                        end
                    end
                end
            end
        end


    
    end


    

end
