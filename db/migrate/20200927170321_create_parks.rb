class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string "url"
      t.string "fullName"
      t.string "park_id"
      t.string "parkCode"
      t.text "description"
      t.string "latitude"
      t.string "longitude"
      t.string "latLong"
      t.string "acitivites"
      t.string "topics"
      t.string "states"
      t.string "contacts"
      t.string "entranceFees"
      t.string "entrancePasses"
      t.text "directionsInfo"
      t.string "directionsURL"
      t.string "operatingHours"
      t.string "addresses"
      t.string "images"
      t.string "weatherInfo"
      t.string "name"
      t.string "designation"
      t.timestamps
    end
  end
end
