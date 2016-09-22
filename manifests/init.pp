# Class: network_address
# ===========================
#
# Full description of class network_address here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
#
# Copyright
# ---------
#
# Copyright 2016 Puppet, Inc.
#
class source_ipaddress($target) {
  file { '/etc/target_ip':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $target,
  }
}
