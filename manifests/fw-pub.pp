#include firewalld
include stdlib

$zone         = 'pub'

class{'firewalld':
  default_zone    => 'trusted',
}

firewalld_zone{$zone:
  ensure           => present,
  purge_rich_rules => false,
  purge_services   => false,
  purge_ports      => false,
  interfaces       => $zone,
}
