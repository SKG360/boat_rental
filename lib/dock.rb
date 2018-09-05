require './lib/boat'

class Dock
  attr_reader :name, :max_rental_time

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental = Hash.new
  end

  def rent(type, renter)
    # begins tracking how long the Boat is rented for.
    @rental[type] = renter

  end

  def rented?
    if @rental.keys[0].hours_rented != 0
      true
    end
  end

  def return
    # stops tracking how long the Boat is rented.

  end

  def log_hour
    # if rented but not returned
    #   @hours_rented += 1
    @rental.sum do |boat, renter|
      boat.hours_rented
    end

  end

  def revenue
    revenue = []
    @rental.each do |boat, renter|
      revenue << boat.price_per_hour * boat.hours_rented
    end
    revenue.sum
    # @rental.keys[0].price_per_hour * @rental.keys[0].hours_rented
  end

end
