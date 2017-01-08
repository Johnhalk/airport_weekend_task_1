require 'airport'
require 'plane'


module Weather

  def self.stormy?
    rand(5) <= 1 ? true : false
  end

end
