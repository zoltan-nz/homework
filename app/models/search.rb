class Search < ActiveRecord::Base
  attr_accessible :e_date, :n_guests, :s_date

  validates :e_date, :n_guests, :s_date, presence: true

  def self.results(search, page)
    @start_date = search.s_date
    @end_date = search.e_date
    @number_of_guest = search.n_guests

    @hosts = Host.has_free_rooms_in_a_period(@start_date, @end_date, @number_of_guest).paginate(page: page, limit: 5)

  end

  def to_param
    "#{id}-#{s_date}-#{e_date}-#{n_guests}"
  end

end
