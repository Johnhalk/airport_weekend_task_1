require 'weather'
require 'airport'

class Plane


    DEFAULT_CAPACITY = 100

    attr_reader :planes, :capacity


  def initialize(capacity=DEFAULT_CAPACITY)

  @planes = []
  @capacity = capacity
  end

def land(airport)

@planes << self unless full? || safe?

end


def take_off(airport)
    airport::planes.shift unless safe?

 end


 private

def safe?
    Weather.stormy? ? (raise "Unable to fly as weather is stormy") : true
  end

end
