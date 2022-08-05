# Class: pulsar::discovery::logging
#
# This module manages pulsar
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class pulsar::discovery::logging (
  $log_dir = $pulsar::log_dir,
) inherits pulsar {

  if (! defined(File[$log_dir])) {
    file { $log_dir :
      ensure => directory,
      owner  => 'pulsar',
      group  => 'pulsar'
    }
  }

  file { "${log_dir}/pulsar-discovery.log":
    ensure => present,
    mode   => '0644',
    owner  => 'pulsar',
    group  => 'pulsar'
  }

}
