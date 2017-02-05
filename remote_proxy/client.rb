require 'drb/drb'

SERVER_URI='druby://localhost:9487'

class GumballMonitor
  attr_reader :machine

  def initialize
    # create DRbObject instance that is connected to our server
    @machine = DRbObject.new_with_uri(SERVER_URI)
  end

  def report
    puts "Gumball Machine: #{machine.location}"
    puts "Current Inventory: #{machine.count} gumballs"
  end
end

gumball_monitor = GumballMonitor.new
gumball_monitor.report

# remote object machine
puts "#{gumball_monitor.machine.count - 10} gumballs leave"

