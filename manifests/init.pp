# Class: pulsar
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
class pulsar(
  $service_broker_enable    = $::pulsar::params::service_broker_enable,
  $service_broker_ensure    = $::pulsar::params::service_broker_ensure,
  $service_broker_manage    = $::pulsar::params::service_broker_manage,
  $service_broker_name      = $::pulsar::params::service_broker_name,
  $service_discovery_enable = $::pulsar::params::service_discovery_enable,
  $service_discovery_ensure = $::pulsar::params::service_discovery_ensure,
  $service_discovery_manage = $::pulsar::params::service_discovery_manage,
  $service_discovery_name   = $::pulsar::params::service_discovery_name,
  $package_name             = $::pulsar::params::package_name,
  $package_ensure           = $::pulsar::params::package_ensure,
  $storage_offloaders       = $::pulsar::params::storage_offloaders,
  $config_name_broker       = $::pulsar::params::config_name_broker,
  $config_name_discovery    = $::pulsar::params::config_name_discovery,
  $log_dir                  = $::pulsar::params::log_dir,
  $logger                   = $::pulsar::params::logger,
  $broker_extra_opts        = undef,
  $broker_mem_opts          = $::pulsar::params::broker_mem_opts,
  $discovery_extra_opts     = undef,
  $discovery_mem_opts       = undef
  ) inherits pulsar::params {

  contain 'pulsar::package'
  contain 'pulsar::config'
  contain 'pulsar::broker::logging'
  contain 'pulsar::discovery::logging'
  contain 'pulsar::broker::service'
  contain 'pulsar::discovery::service'

}
