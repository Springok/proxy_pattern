require 'drb/drb'

URI='druby://localhost:9487'

class GumballMachine
  include DRb::DRbUndumped
  #public method: location, count
  attr_accessor :location, :count

  def initialize(location = 'Taipei', count = 100)
    @location = location
    @count = count
  end
end

class GumballMechineInfoCollector
  def get_machine_info(location)
    count = [123, 321, 123456]

    # GumballMechine.find_by(location: location)
    GumballMachine.new(location, count.sample)
  end
end

object = GumballMechineInfoCollector.new

DRb.start_service(URI, object)
puts 'service gumball machine collector started...'
DRb.thread.join



