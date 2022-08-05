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
define pulsar::discovery::setting (
  $ensure = present,
  $value
) {

  if $pulsar::service_discovery_enable == true {
    augeas { "pulsar_discovery_${title}":
      lens    => 'Shellvars.lns',
      incl    => $pulsar::config_name_discovery,
      context => "/files/${pulsar::config_name_discovery}",
      changes => "set $title $value",
      notify  => Service[$pulsar::service_discovery_name],
      require => Package[$pulsar::package_name]
    }
  }

}
