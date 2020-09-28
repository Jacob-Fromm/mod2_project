require 'rest-client'
require 'json'

class Park < ApplicationRecord
     has_many :trips
     has_many :users, through: :trips


    def park_data
    url = "https://developer.nps.gov/api/v1/campgrounds?limit=10&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
    resp = RestClient.get(url)
    json_hash = JSON.parse(resp)
    p json_hash
    end
    
end
