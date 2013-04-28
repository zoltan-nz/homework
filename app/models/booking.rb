class Booking < ActiveRecord::Base
  attr_accessible :end_date, :number_of_guests, :room_id, :start_date

  belongs_to :room

  validates :room_id, presence: true
  validates :start_date, :end_date, presence: true
  validates :number_of_guests, presence: true, numericality: {only_integer: true, greater_than: 0 }
  validates_presence_of :room

  #Result: how many bed booked on a day

  scope :number_of_bed_booked, lambda {|day| where("? BETWEEN bookings.start_date AND bookings.end_date", day).select("number_of_guests")}
  scope :booked_in_a_period, lambda  {|sd,ed| where("(:sd BETWEEN start_date AND end_date) OR (:ed BETWEEN start_date AND end_date) OR ((:sd < start_date) AND ( end_date < :ed))", sd: sd, ed: ed)}



  #Result: integer - a max number of how many bed booked in a period
  def self.max_number_of_bed_booked_in_a_period(sd, ed)
    result = where("(:sd BETWEEN start_date AND end_date) OR (:ed BETWEEN start_date AND end_date) OR ((:sd < start_date) AND ( end_date < :ed))", sd: sd, ed: ed).maximum(:number_of_guests)
    result = 0 if result.nil?
    result
  end

end