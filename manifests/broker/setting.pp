# Class: pulsar::broker::setting
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
define pulsar::broker::setting (
  $ensure = present,
  $value
) {

  augeas { "pulsar_broker_${title}":
    lens    => 'Shellvars.lns',
    incl    => $pulsar::config_name_broker,
    context => "/files/${pulsar::config_name_broker}",
    changes => "set $title $value",
    notify  => Service[$pulsar::service_broker_name],
    require => Package[$pulsar::package_name]
  }

}
