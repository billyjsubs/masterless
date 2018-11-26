class  profile::firewall::services::mq{

$service      = 'mq'
$description  = 'CIS MQ node ports'
$zone         = 'pub'

firewalld::custom_service{"$service":
  short       => "$service",
  description => "$description",
  port        => [
		   {
                     #MQ
                     'port'       => '4750:4752',
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
