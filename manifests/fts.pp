include firewalld
include stdlib

$zone         = 'pub'
$service      = 'node_fts'
$description  = 'CIS FTS node ports'


firewalld_zone{$zone:
  ensure           => present,
  purge_rich_rules => false,
  purge_services   => false,
  purge_ports      => false,
  interfaces       => $zone,
}

include ::profile::firewall::services::fts
