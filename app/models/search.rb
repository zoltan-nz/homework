class Search < ActiveRecord::Base
  attr_accessible :e_date, :n_guests, :s_date

  #validates :n_guests, only_integer: true

  def results
    @rooms ||= find_bookings
  end

private

  def find_bookings
    start_date = self.s_date
    end_date = self.e_date
    number_of_guest = self.n_guests

    @rooms ||= Room.includes(:bookings).where("(rooms.capacity - bookings.number_of_guests) >= 0")


  end

end
