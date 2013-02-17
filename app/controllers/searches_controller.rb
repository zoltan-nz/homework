class SearchesController < ApplicationController

  def index

    @search = Search.new
    @bookings = Booking.search(params[:search])

    if params[:search]
      @s_date = params[:search][:s_date].present? ? Date.parse(params[:search][:s_date]) : @s_date = ""
      @e_date = params[:search][:e_date].present? ? Date.parse(params[:search][:e_date]) : @e_date = ""
      @n_guests = params[:search][:n_guests].present? ? params[:search][:n_guests] : @n_guests = ""

    end

  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(params[:search])
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  def update

    @search = Search.find(params[:id])
    render 'index'
  end

end
