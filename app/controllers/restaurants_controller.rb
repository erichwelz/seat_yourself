class RestaurantsController < ApplicationController
  
  def index
    @restaurants = Restaurant.all
  end

  def new

  end

  def create

  end

  def show
    @restaurant = Restaurant.find(params[:id])

    if current_user
      @reservation = Reservation.new
    end
  end

  def edit

  end

  def destroy

  end

end
