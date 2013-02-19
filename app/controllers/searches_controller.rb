class SearchesController < ApplicationController

  def index

    @search = Search.new

  end

  def new
    @search = Search.new

  end

  def create
    @search = Search.new(params[:search])
    if @search.save
      redirect_to @search
    else
      render 'index'
    end

  end

  def show
    @search = Search.find(params[:id])

    @start_date = @search.s_date
    @end_date = @search.e_date
    @number_of_guest = @search.n_guests

    #@hosts = Host.available_hosts(@start_date, @end_date, @number_of_guest, params[:page])
    @hosts = Search.results(@search, params[:page])

    #TODO
    @pages = Host.paginate(page: params[:page], limit: 5)

  end

  def update

    @search = Search.find(params[:id])
    redirect_to @search

  end

end
