unicorn puppet module based on sbilo-unicorn
=============

This module configures a Unicorn multi-instance installation.

Configure an instance
---------------------
Basic configuration of an unicorn instance (example taken from the puppet module).

	unicorn::instance { 'puppetmaster':
    	    working_directory => '/usr/share/puppet/ext/rack/files/',
    	    listen            => '/var/run/puppet/puppetmaster_unicorn.sock',
    	    pid               => '/var/run/puppet/puppetmaster_unicorn.pid',
    	    user              => 'puppet',
  	}
  	
Tested On:
    * Centos 7  => OK
    * Fedora 23 => OK
    * Debian 8  => OK
