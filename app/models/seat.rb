class Seat < ActiveRecord::Base
  belongs_to :flight
  validate :baggage_allowance_overlimit,:capacity_overlimt
  def baggage_allowance_overlimit
    if baggage > flight.baggage_allowance
      errors.add(:baggage_allowance,"You have too much baggage")
    end
  end

  def capacity_overlimt
    if flight.seats.size >= flight.capacity 
      errors.add("Seats","The flight is fully booked")
    end
  end
end
