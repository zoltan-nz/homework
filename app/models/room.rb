class Room < ActiveRecord::Base
  attr_accessible :capacity, :host_id
end
