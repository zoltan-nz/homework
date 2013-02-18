class SearchesController < ApplicationController

  def index

    @search = Search.new

  end

  def new
    @search = Search.new
    @search.create_global_variables
  end

  def create
    @search = Search.create!(params[:search])
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    #@search.create_global_variables
    @start_date = @search.s_date
    @end_date = @search.e_date
    @number_of_guest = @search.n_guests
  end

  def update

    @search = Search.find(params[:id])
    redirect_to @search
  end

end
