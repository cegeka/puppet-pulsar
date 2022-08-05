# Class: pulsar::params
#
# This is a private class and should not be called directly
#
class pulsar::params (
  $service_broker_enable = true,
  $service_broker_ensure = 'running',
  $service_broker_manage = true,
  $service_broker_name = 'pulsar-broker',
  $service_discovery_enable = false,
  $service_discovery_ensure = 'stopped',
  $service_discovery_manage = false,
  $service_discovery_name = 'pulsar-discovery',
  $package_ensure = 'present',
  $package_name = 'apache-pulsar',
  $storage_offloaders = 'absent',
  $config_ensure = 'present',
  $config_folder = '/opt/pulsar/conf',
  $config_name_broker = '/opt/pulsar/conf/broker.conf',
  $config_name_discovery = '/opt/pulsar/conf/discovery.conf',
  $log_dir = '/var/log/pulsar',
  $logger = 'RollingFile',
  $broker_mem_opts = '-Xms2g -Xmx2g -XX:MaxDirectMemorySize=4g'
) {

}
