require 'socket'
Facter.add(:source_ipaddress) do
  setcode do
    # read the target network address
    target = File.read('/etc/target_ip').strip

    # http://stackoverflow.com/a/5030118
    UDPSocket.open {|s| s.connect(target, 1); s.addr.last}

  end
end
