include firewalld
include stdlib

$zone         = 'pub'
$service      = 'node_was'
$description  = 'CIS WAS node ports'


firewalld_zone{$zone:
  ensure           => present,
  purge_rich_rules => false,
  purge_services   => false,
  purge_ports      => false,
  interfaces       => $zone,
}

include ::profile::firewall::services::was
