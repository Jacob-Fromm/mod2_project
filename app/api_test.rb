require "rubygems"
require "httparty"

class NPS
    include HTTParty
    base_uri "https://jonahtaylor-national-park-service-v1.p.rapidapi.com/"

    def parks
        self.class.get("/parks")
    end

    all_parks = NPS.new
    puts all_parks.parks
    
    # url = URI("https://jonahtaylor-national-park-service-v1.p.rapidapi.com/parks")

    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    # request = Net::HTTP::Get.new(url)
    # request["x-api-key"] = 'e1pgCWYc3nsrAOY3HnhZGQ75nuJffj4gyrsQjAD5'
    # request["x-rapidapi-host"] = 'jonahtaylor-national-park-service-v1.p.rapidapi.com'
    # request["x-rapidapi-key"] = '8afd7ffa98msh66c5e14a405f912p133da5jsne6eb4d751d16'

    # response = http.request(request)
    # puts response.read_body

end