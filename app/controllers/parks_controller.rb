require 'uri'
require 'httparty'
require 'openssl'

class ParksController < ApplicationController

    def index
        @parks = self.class.all_parks
    end
    
    def all_parks
        request_api(URI("https://jonahtaylor-national-park-service-v1.p.rapidapi.com/parks"))
    end
    
    private

    
    def request_api(url)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-api-key"] = 'e1pgCWYc3nsrAOY3HnhZGQ75nuJffj4gyrsQjAD5'
        request["x-rapidapi-host"] = 'jonahtaylor-national-park-service-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = '8afd7ffa98msh66c5e14a405f912p133da5jsne6eb4d751d16'

        response = http.request(request)
    end
        
    












end
