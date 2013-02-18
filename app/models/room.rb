class Room < ActiveRecord::Base
  attr_accessible :capacity, :host_id

  belongs_to :host
  has_many :bookings

  validates :capacity, presence: true
  validates :host_id, presence: true
  validates_presence_of :host

  #default_scope order: 'rooms.host_id ASC'

  def self.available_rooms(start_date, end_date, number_of_guest, host)
    @rooms = []
    @room_query = Room.find_all_by_host_id(host)
    @room_query.each do |room|
      @rooms << room if (room.free_in_a_period(start_date, end_date) >= number_of_guest)
    end
    @rooms
  end

  def available?(start_date, end_date)
    self.free_in_a_period(start_date, end_date) > 0
  end

    def number_of_bed_booked(date)
    number_of_bed_booked = 0
    self.bookings.each do |booking|
       number_of_bed_booked += booking.number_of_guests.to_i if ((booking.start_date <= date) && (date <= booking.end_date))
    end
    number_of_bed_booked
  end

  def num_of_bed_booked_in_period(start_date, end_date)
    booked = []
    (start_date..end_date).each do |date|
      booked << number_of_bed_booked(date)
    end
    booked.max
  end

  def free_in_a_period(start_date, end_date)
     self.capacity - num_of_bed_booked_in_period(start_date, end_date)
  end

end
