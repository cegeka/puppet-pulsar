# Class: pulsar::config
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
class pulsar::config (
  $config_ensure         = $pulsar::config_ensure,
  $config_folder         = $pulsar::config_folder,
  $config_name_broker    = $pulsar::config_name_broker,
  $config_name_discovery = $pulsar::config_name_discovery
) inherits pulsar {

  file { $config_name_broker :
    ensure  => $config_ensure,
    owner   => 'pulsar',
    group   => 'pulsar',
    require => Package[$pulsar::package_name]
  }

  file { $config_name_discovery :
    ensure  => $config_ensure,
    owner   => 'pulsar',
    group   => 'pulsar',
    require => Package[$pulsar::package_name]
  }

}
