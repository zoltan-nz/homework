class Room < ActiveRecord::Base
  attr_accessible :capacity, :host_id

  belongs_to :host
  has_many :bookings

  validates :capacity, presence: true
  validates :host_id, presence: true
  validates_presence_of :host

  #default_scope order: 'rooms.host_id ASC'

  #scope :number_of_bed_booked_scope, lambda {|day| self.includes(:bookings).where("? BETWEEN bookings.start_date AND bookings.end_date", day).bookings.select("number_of_guests")}

  #Result: array - list of rooms where are free bed in a given period with given number of guests who need free room
  def self.available_rooms(start_date, end_date, number_of_guest, host)
    @rooms = []
    @room_query = Room.find_all_by_host_id(host)
    @room_query.each do |room|
      @rooms << room if (room.number_of_room_free_in_a_period(start_date, end_date) >= number_of_guest)
    end
    @rooms
  end

  #Result: boolean - true if room available in given period
  def available?(start_date, end_date)
    self.number_of_room_free_in_a_period(start_date, end_date) > 0
  end

  #Result: integer - Max number of bed booked in a given period
  def number_of_bed_booked_in_a_period(start_date, end_date)
    self.bookings.max_number_of_bed_booked_in_a_period(start_date, end_date)
  end

  #Result: integer - how many room free in given period
  def number_of_room_free_in_a_period(start_date, end_date)
     self.capacity - self.bookings.max_number_of_bed_booked_in_a_period(start_date, end_date)
  end

end
