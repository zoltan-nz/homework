module RoomsHelper

  def is_available(start_date, end_date, room)
    room.available?(@start_date, @end_date) ? "is available" : "is not available"
  end

end
