require 'faraday'
require 'json'

class Connection
    BASE = "developer.nps.gov/api/v1"

    def self.api
    Faraday.new(url: BASE) do |faraday|
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['api-key'] = ENV['e1pgCWYc3nsrAOY3HnhZGQ75nuJffj4gyrsQjAD5']
        end
    end
end