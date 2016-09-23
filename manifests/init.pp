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
define source_ipaddress($target) {
  $path = '/etc/target_ip'
  if ! defined(File[$path]) {
    file { $path:
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => $target,
    }
  }

  file_line { $target:
    ensure  => present,
    path    => $path,
    line    => $target,
  }
}
