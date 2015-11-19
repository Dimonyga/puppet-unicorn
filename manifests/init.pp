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
  if ($osfamily == "RedHat") {
    package { "glibc_headers":
      ensure => present,
    }
  }

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
  if ($unicorn::instance == undef) {
    notice "no hiera instances"
  } else {
    $hiera_values = hiera_hash($unicorn::instance, undef)
    create_resources (unicorn::instance, $hiera_values)
  }


}
