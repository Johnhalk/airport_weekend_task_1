require_relative 'plane'
require_relative 'weather'

class AirportStation

  DEFAULT_CAPACITY = 100

  attr_reader :planes, :capacity


  def initialize(capacity=DEFAULT_CAPACITY)

  @planes = []
  @capacity = capacity
  end

  def landed?(plane)
     @planes.include?(plane)
   end

   def taken_off?(plane)
     @planes.include?(plane) ? false : true
   end


def current_airport_capacity
  return "The amount of planes at the airport are now #{@planes.count}  The plane that has just landed is #{@planes[-1]} ."
end

   def full?
      @planes.count == @capacity ? (raise "Airport is full, cannot land") : false
    end

end
