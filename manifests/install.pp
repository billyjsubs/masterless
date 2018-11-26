file { '/tmp/licence':
  source  => 'puppet:///modules/ilmt/licence.txt',
  ensure => 'present'
}
