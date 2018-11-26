class  profile::firewall::services::was{

$service      = 'was'
$description  = 'CIS WAS TCP ports'
$zone         = 'pub'

firewalld::custom_service{"$service":
  short       => "$service",
  description => "$description",
  port        => [
                   {
                     'port'       => '30000',
                     'protocol'   => 'tcp',
                   },
                   {
                     'port'       => '30002',
                     'protocol'   => 'tcp',
                   },
                   {
                     'port'       => '30011:30020',
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
