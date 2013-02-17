class Room < ActiveRecord::Base
  attr_accessible :capacity, :host_id

  belongs_to :host
  has_many :bookings

  validates :capacity, presence: true
  validates :host_id, presence: true
  validates_presence_of :host

  #default_scope order: 'rooms.host_id ASC'

  def number_of_bed_booked(date)
    number_of_bed_booked = 0
    self.bookings.each do |booking|
       number_of_bed_booked += booking.number_of_guests.to_i if booking.start_date < date && date < booking.end_date
    end
    number_of_bed_booked
  end

  def free_in_a_period(start_date, end_date)
    start_date = Date.parse(start_date)
    end_date.empty? ? end_date = start_date : end_date = Date.parse(end_date)
    free_in_a_period = self.capacity
    (start_date..end_date).each do |date|
      free_in_a_period -= number_of_bed_booked(date)
      return 0 if free_in_a_period <= 0
    end
    free_in_a_period
  end

end
