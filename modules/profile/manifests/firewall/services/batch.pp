class  profile::firewall::services::batch{

$service      = 'batch'
$description  = 'CIS Batch node ports'
$zone         = 'pub'

firewalld::custom_service{"$service":
  short       => "$service",
  description => "$description",
  port        => [
                   {
                     #FTS - SFTPPLus Control Port
                     'port'       => '10021',
                     'protocol'   => 'tcp',
                   },
				   {
                     #FTS - SFTPPLus Passive Port range
                     'port'       => '8000:8199',
                     'protocol'   => 'tcp',
                   },
                 ]
  }

  firewalld_service{"$description":
    ensure  => 'present',
    service => $service,
    zone    => $zone,
  }

}
