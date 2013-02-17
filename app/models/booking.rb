class Booking < ActiveRecord::Base
  attr_accessible :end_date, :number_of_guests, :room_id, :start_date

  belongs_to :room

  validates :room_id, presence: true
  validates :start_date, :end_date, presence: true
  validates :number_of_guests, presence: true, numericality: {only_integer: true, greater_than: 0 }
  validates_presence_of :room

  #default_scope order: 'bookings.start_date ASC'

  def self.search(query = {})
    logger.debug "Search method query: #{query}"
    @bookings_query ||= self.order(:id).limit(5).includes(:room)


  end

end