class  profile::firewall::services::oracletcps{

$service      = 'oracle'
$description  = 'Oracle TCPS ports'
$zone         = 'pub'

firewalld::custom_service{"$service":
  short       => "$service",
  description => "$description",
  port        => [
                   {
                     'port'       => '1699',
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
