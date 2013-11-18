class ReservationsController < ApplicationController
  before_filter :load_restaurant
  before_filter :ensure_logged_in

  def new
    @reservation = Reservation.new
  end

   def show
    @restaurant = Restaurant.find(params[:id])

    if current_user
      @reservation = Reservation.new
    end
  end

  def create
    #@reservation = Reservation.new(reservation_params)
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id


    if @reservation.save
      redirect_to restaurant_path(@restaurant), notice: "Reservation submitted."
    else
      render :action => :show
    end
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def reservation_params
    params.require(:reservation).permit(:meal_time, :meal_date, :party_size, :user_id, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end


