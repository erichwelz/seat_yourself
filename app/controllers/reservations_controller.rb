class ReservationsController < ApplicationController
  before_filter :ensure_logged_in

  def new
    @reservation = Reservation.new
  end

  def show
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redire_to restaurant_path(@restaurant), notice: "Reservation submitted."
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

end
