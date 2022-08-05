# Class: pulsar::broker::service
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
class pulsar::broker::service (
  $service_enable = $::pulsar::params::service_broker_enable,
  $service_ensure = $::pulsar::params::service_broker_ensure,
  $service_name   = $::pulsar::params::service_broker_name,
) inherits pulsar {
  if !($service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $service_enable == true {
    file { '/etc/sysconfig/pulsar-broker':
      ensure => file,
      content => template('pulsar/broker/pulsar-broker-sysconfig.erb'),
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
