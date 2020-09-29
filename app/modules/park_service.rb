module ParkService
  class Client
    
  
	
	def request(endpoint)
		uri = URI.parse("https://developer.nps.gov/api/v1/#{endpoint}")
		request = Net::HTTP::Get.new(uri)
		request["X-Api-Key"] = "e1pgCWYc3nsrAOY3HnhZGQ75nuJffj4gyrsQjAD5"

		req_options = {
			use_ssl: uri.scheme == "https",
		}

		response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
			http.request(request)
		end

		body = JSON.parse(response.body)
		body["data"]
	end

	def parks
		request("parks?")
	end






    # def initialize
    #   @host = 'jonahtaylor-national-park-service-v1.p.rapidapi.com'
    #   @key = 'e1pgCWYc3nsrAOY3HnhZGQ75nuJffj4gyrsQjAD5'
    # end
   
    # def park(parkCode)
    #   # get("parks?parkCode=#{parkCode}")
    # end
   
    # def parks
    #   get("parks")
    # end
   
    # private
   
    # def get(path)
    #   response = Excon.get(
    #     'https://' + @host + '/' + path + '.json?print=pretty',
    #     headers: {
    #       'x-rapidapi-host' => @host,
    #       'x-rapidapi-key' => @key,
    #     }
    #   )
    #   byebug
    #   return false if response.status != 200
    #   JSON.parse(response.body)
    # end
  end
end