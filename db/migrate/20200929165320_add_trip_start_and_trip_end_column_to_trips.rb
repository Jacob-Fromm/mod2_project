class AddTripStartAndTripEndColumnToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :trip_start_date, :string
    add_column :trips, :trip_end_date, :string
  end
end
