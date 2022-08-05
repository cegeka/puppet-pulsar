# Class: pulsar::package
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
class pulsar::package (
  $package_ensure     = $pulsar::package_ensure,
  $package_name       = $pulsar::package_name,
  $storage_offloaders = $pulsar::storage_offloaders
) inherits pulsar {

  package { $package_name :
    ensure => $package_ensure,
  }

  package { 'apache-pulsar-offloaders':
    ensure  => $storage_offloaders,
    require => Package[$package_name]
  }

}
