# Class: pulsar::broker::connector
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
define pulsar::broker::connector(
  ensure = present
) {

  package { "apache-pulsar-connector-${title}":
    ensure => $ensure
  }

}
