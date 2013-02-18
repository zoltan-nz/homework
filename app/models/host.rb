class Host < ActiveRecord::Base
  attr_accessible :address, :name
  
  has_many :rooms, include: :bookings
  has_many :bookings, through: :rooms

  validates :address, presence: true
  validates :name, presence: true

  #default_scope order: 'hosts.name ASC'

  #scope :free_rooms, lambda {|num| joins(:rooms).includes(:bookings).where("((rooms.capacity - bookings.number_of_guests) >= :num)", num: num,)}
  #scope :booked_between, lambda {|sd,ed| joins(:rooms).includes(:bookings).where("((bookings.start_date < :sd) AND (:sd < bookings.end_date)) OR ((bookings.start_date < :ed) AND (:ed < bookings.end_date))", sd: sd, ed: ed)}


  def self.available_hosts(start_date, end_date, number_of_guest)
    @hosts = []
    @host_all ||= Host.all
    @host_all.each do |host|
      @hosts << host if (host.rooms.available_rooms(start_date, end_date, number_of_guest, host.id).size > 0)
    end
    @hosts
  end

end
