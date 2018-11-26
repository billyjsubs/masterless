class  profile::firewall::services::qas{

$service      = 'qas'
$description  = 'CIS qas node ports'
$zone         = 'pub'

firewalld::custom_service{"$service":
  short       => "$service",
  description => "$description",
  port        => [
		   {
                     #QAS
                     'port'       => '9072',
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
