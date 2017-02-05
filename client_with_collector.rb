require 'drb/drb'

SERVER_URI='druby://localhost:9487'

class MultiGumballMonitor
  def report
    DRb.start_service
    info_collector = DRbObject.new_with_uri(SERVER_URI)

    %w(HsinChu Taipei HongKong).each do |location|
      machine = info_collector.get_machine_info(location)

      puts "Gumball Machine: #{machine.location}"
      puts "Current Inventory: #{machine.count} gumballs"
      puts "\n"
    end
  end
end

MultiGumballMonitor.new.report

