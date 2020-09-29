# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Park.destroy_all
User.destroy_all
Trip.destroy_all

# (10).times do
#     Park.create
# end

# names = ['bill', 'karen', 'sally', 'dave', 'biff', 'glinda']
# usernames = ['gmoney', 'camperperson', 'iluvoutdoors','adironackjack']
# (10).times do
#     User.create(name: names.sample, username: usernames.sample)
# end

def create_parks_from_api
    url = "https://developer.nps.gov/api/v1/parks?limit=500&api_key=GhGhpL8DrRdsEAwfu0Mn4gXuhgkdnhVnrEnNfmRx"
    resp = RestClient.get(url)
    json_hash = JSON.parse(resp)
    park_codes = []

    json_hash.each do |data_key, value|
        if data_key["data"]
            value.each do |hash_keys|
                Park.create(park_name: hash_keys["fullName"], park_code: hash_keys["parkCode"])
                
            end
        end
    end

end

create_parks_from_api