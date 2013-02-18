class Search < ActiveRecord::Base
  attr_accessible :e_date, :n_guests, :s_date

  #validates :n_guests, only_integer: true

  def results
    @start_date = self.s_date
    @end_date = self.e_date
    @number_of_guest = self.n_guests

    @hosts = Host.available_hosts(@start_date, @end_date, @number_of_guest)

  end

end
