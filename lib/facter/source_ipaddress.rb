require 'socket'
require 'rubygems'
Facter.add(:source_ipaddress) do
  setcode do
    # read the target network address
    v = {}

    # read the list of IP address targets, distributed from your roles and
    # profiles via pluginsync
    target_file = File.join(Puppet[:pluginfactdest], 'source_ipaddress_targets.txt')
    begin
      File.readlines(target_file).each do |line|
        begin
          host = line.strip
          # http://stackoverflow.com/a/5030118
          v[host] = UDPSocket.open {|s| s.connect(host, 1); s.addr.last}
        rescue Exception => e
          # connection errors per host
          v[host] = "ERROR:  #{e.message}"
        end
      end
    rescue Exception => e
      # error reading target_ip file
      v['ERROR'] = e.message
    end

    v
  end
end
