class Host < ActiveRecord::Base
  attr_accessible :address, :name
  
  has_many :rooms, include: :bookings
  has_many :bookings, through: :rooms

  validates :address, presence: true
  validates :name, presence: true

  #Paramters: (sd, ed, num) => start date, end date and desired space in booking period
  #Result: list of hosts
  scope :has_free_rooms_in_a_period, lambda {|sd,ed,num| joins(:rooms).includes(:bookings).where("(rooms.capacity - :num - (SELECT MAX(bookings.number_of_guests) WHERE (:sd BETWEEN start_date AND end_date) OR (:ed BETWEEN start_date AND end_date) OR ((:sd < start_date) AND ( end_date < :ed)))) >= 0", sd: sd, ed: ed, num: num)}

  #Result: Array - list of hosts where are free rooms in requested period.
  def self.available_hosts(start_date, end_date, number_of_guest, page)
    @hosts = []
    @host_all = Host.paginate(page: page, limit: 5)
    @host_all.each do |host|
      @hosts << host if (host.rooms.available_rooms(start_date, end_date, number_of_guest, host.id).size > 0)
    end
    @hosts
  end

end
