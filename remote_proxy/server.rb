require 'drb/drb'

URI='druby://localhost:9487'

class GumballMechine
  # public method: location, count
  attr_accessor :location, :count

  def initialize(location = 'Taipei', count = 100)
    @location = location
    @count = count
  end
end

object = GumballMechine.new

DRb.start_service(URI, object)
puts 'service started...'
DRb.thread.join
