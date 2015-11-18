# Class: unicorn
#
# This module manages unicorn
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class unicorn {

  require ruby::dev

  if (!defined(Package['unicorn'])) {
    package { 'unicorn':
      provider => 'gem',
      ensure   => installed,
      require  => Package['rubygems'],
    }
  }

  file { '/etc/unicorn.d': ensure => directory, }

  file { '/etc/init.d/unicorn':
    source => 'puppet:///modules/unicorn/unicorn',
    owner  => 'root',
    group  => 'root',
    mode   => '0744',
  }

  $hiera_values = hiera_hash (unicorn::instance)
  create_resources (unicorn::instance, $hiera_values)


}
