class Bed < ActiveRecord::Base
  attr_accessible :room_id

  belongs_to :room
end
