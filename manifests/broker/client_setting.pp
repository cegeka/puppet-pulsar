# Class: pulsar::broker::client_setting
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
define pulsar::broker::client_setting (
  $ensure = present,
  $value
) {

  augeas { "pulsar_broker_${title}":
    lens    => 'Shellvars.lns',
    incl    => $pulsar::client_config_name_broker,
    context => "/files/${pulsar::client_config_name_broker}",
    changes => "set $title $value",
    require => Package[$pulsar::package_name]
  }

}
