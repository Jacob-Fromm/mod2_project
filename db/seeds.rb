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

10 times do
    Park.create
end

names = ['bill', 'karen', 'sally', 'dave', 'biff', 'glinda']
usernames = ['gmoney', 'camperperson', 'iluvoutdoors','adironackjack']
10 times do
    User.create(name: names.sample, username: usernames.sample)
end