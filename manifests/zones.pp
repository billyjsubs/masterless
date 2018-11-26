
  #Backup the original interface config file
  file {'Backup Config eth1':
    require=> Package[$packages],
    path   => '/etc/sysconfig/network-scripts/.backup-ifcfg-eth1',
    ensure => present,
    source => '/etc/sysconfig/network-scripts/ifcfg-eth1',
    before => Augeas['Configure Network Interface 1'],
  }

  #Perform configuration changes to the interface
  augeas {'Configure Network Interface 1' :
        require => File['Backup Config eth1'],
        context => "/files/etc/sysconfig/network-scripts/ifcfg-eth1",
        changes => ["set ZONE pub", "set DEVICE pub", "set NAME pub"],
        before  => File['Create New interface config file 1'],
    }

  #Change the configuration filename	
  file {'Create New interface config file 1':
    require => Augeas['Configure Network Interface 1'],
    path    => '/etc/sysconfig/network-scripts/ifcfg-pub',
    ensure  => present,
    source  => '/etc/sysconfig/network-scripts/ifcfg-eth1',
    before  => File['Remove ifcfg-eth1'],
  }

 #Remove old interface configuration
 file {'Remove ifcfg-eth1':
   require => File['Create New interface config file 1'],
   path    => '/etc/sysconfig/network-scripts/ifcfg-eth1',
   ensure  => absent,
 }


