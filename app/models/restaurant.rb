class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_and_belongs_to_many :categories

  has_many :users, through: :reservations

#   def enough_space?(reservation)
#     peeps = self.reservations. #self may be semantic in this case
#       where(meal_time: reservation.meal_time).sum(:party_size)
#     (peeps + reservation.party_size) <= self.seats 
#   end

# end

  def enough_space?(reservation)
    @reservation = reservation

    proposed_party_size = reservation.party_size
         #if proposed party_size is greater than seats_available, reject reservation and inform user, else accept reservation and confirm with email
    find_seats_available >= proposed_party_size

  end

  def find_seats_available #checked!
  #find the right restaurant
 
  seats_available = self.seats # 10 seats available
  #whenever we make a reservation, it subtract the number of seats reserved from the total number of seats.

  #for each reservation subtract the party_size from seats available.
    previous_reservations = self.reservations(0..-2).where(meal_time: @reservation.meal_time ) #meal_time

    #self.reservations
    previous_reservations.each do |r| #reservation for 5 
      seats_available -= r.party_size # 10 - 5 
    end
  seats_available # 5 
  end
end

# def enough_space?
#     proposed_party_size = @reservation.party_size
#      #if proposed party_size is greater than seats_available, reject reservation and inform user, else accept reservation and confirm with email
#     if find_seats_available >= proposed_party_size
#       return true
#     else 
#       false
#     end 
#   end

#   def find_seats_available #checked!
#     #find the right restaurant
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     seats_available = @restaurant.seats
#     #whenever we make a reservation, it subtract the number of seats reserved from the total number of seats.

#     #for each reservation subtract the party_size from seats available.

#     @restaurant.reservations.each do |r|
#       seats_available -= r.party_size
#     end
#     seats_available
#   end


