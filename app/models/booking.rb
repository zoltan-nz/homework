class Booking < ActiveRecord::Base
  attr_accessible :end_date, :number_of_guests, :room_id, :start_date
end
