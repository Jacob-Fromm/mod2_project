class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :park

  validate :start_date_before

  def start_date_before
    if self.trip_start_date.to_date > self.trip_end_date.to_date
       puts self.trip_start_date.to_date
      redirect_to home_path
    end
  end
end
