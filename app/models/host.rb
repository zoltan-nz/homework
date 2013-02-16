class Host < ActiveRecord::Base
  attr_accessible :address, :name
  
  has_many :rooms

  validates :address, presence: true
  validates :name, presence: true

  default_scope order: 'hosts.name ASC'
end
