class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :park

  validates :trip_start_date, :trip_end_date, presence: true
  validates_date :trip_start_date, on_or_after: lambda {Date.current} 
  validates_date :trip_end_date, after: :trip_start_date
  
end
