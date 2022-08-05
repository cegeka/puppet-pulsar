# Class: pulsar::discovery::service
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
class pulsar::discovery::service (
  $service_enable = $::pulsar::service_discovery_enable,
  $service_ensure = $::pulsar::service_discovery_ensure,
  $service_name   = $::pulsar::service_discovery_name,
) inherits pulsar {
  if !($service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $service_enable == true {
    file { '/etc/sysconfig/pulsar-discovery':
      ensure => file,
      content => template('pulsar/broker/pulsar-discovery-sysconfig.erb'),
      notify  => Service[$service_name]
    }

    service { $service_name:
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
