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

    @reservation = @restaurant.reservations.build(reservation_params)

    @reservation.user_id = current_user.id
    #validates :enough_space? => true
    # puts " ---------------------------------------------------------------------------------------------------------------------------------"
    # puts find_seats_available
    # puts " ---------------------------------------------------------------------------------------------------------------------------------"

    if @restaurant.enough_space?(@reservation)
      @reservation.save
      redirect_to current_user ,notice: "Reservation submitted."
    else
      flash[:notice] = "Sorry, not enough seats for your party"
      render :action => :new
    end
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to current_user, notice: "Reservation cancelled"

  end
  private
  def reservation_params
    params.require(:reservation).permit(:meal_time, :meal_date, :party_size, :user_id, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end


