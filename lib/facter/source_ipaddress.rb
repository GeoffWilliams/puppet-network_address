require 'socket'
Facter.add(:source_ipaddress) do
  setcode do
    # read the target network address
    begin
      v = {}
      File.readlines('/etc/target_ip').each do |line|
        host = line.strip
        # http://stackoverflow.com/a/5030118
        begin
          v[host] = UDPSocket.open {|s| s.connect(target, 1); s.addr.last} 
        rescue Exception => e
          v[host] = "ERROR:  #{e.message}"
        end
      end
    rescue Exception => e
      "ERROR:  #{e.message}"
    end
  end
end
