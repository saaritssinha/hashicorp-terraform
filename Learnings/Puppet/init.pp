class apache {


package {'apache2':
ensure => installed,
}

file { '/var/www/html/index.html':
  ensure => absent,
}

file { '/var/www/html/':
          ensure => present,
          source => "/home/ubuntu/new/helloworld/*",
}

package {'apache2':
restart,
}

}
