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

   def enough_space?
    proposed_party_size = @reservation.party_size
     #if proposed pary_size is greater than seats_available, reject reservation and inform user, else accept reservation and confirm with email
    if find_seats_available >= proposed_party_size
      return true
    else 
      false
    end 
  end

  def find_seats_available #checked!
    #find the right restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    seats_available = @restaurant.seats
    #whenever we make a reservation, it subtract the number of seats reserved from the total number of seats.

    #for each reservation subtract the party_size from seats available.

    @restaurant.reservations.each do |r|
      seats_available -= r.party_size
    end
    seats_available
  end

  def create
    #@reservation = Reservation.new(reservation_params)
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id
    #validates :enough_space? => true
    puts " ---------------------------------------------------------------------------------------------------------------------------------"
    puts find_seats_available
    puts " ---------------------------------------------------------------------------------------------------------------------------------"
    if enough_space? 
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


