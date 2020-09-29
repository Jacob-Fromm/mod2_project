require 'pry'
require 'rest-client'
require 'json'
class Parks
    def parks
        response = RestClient.get("https://developer.nps.gov/api/v1/parks?&api_key=Kt4mt3BWhB06mkfBRFiOZdb6A3DUwH0CcKORnguX")
        
        json = JSON.parse(response)
        parks = json["data"]
    end
end

parks