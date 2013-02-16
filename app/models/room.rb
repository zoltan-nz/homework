class Room < ActiveRecord::Base
  attr_accessible :capacity, :host_id

  belongs_to :host

  validates :capacity, presence: true
  validates :host_id, presence: true

  default_scope order: 'rooms.host_id ASC'

end
