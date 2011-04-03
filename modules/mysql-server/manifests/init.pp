class mysql-server {
  
  package { "mysql-server": ensure => installed, require => Class["apt"] }
  package { "mysql-client": ensure => installed, require => Class["apt"] }

  service { "mysql":
    enable => true,
    ensure => running,
    require => Package["mysql-server"],
  }

  file { "/var/lib/mysql/my.cnf":
    owner => "mysql", group => "mysql",
    source => "puppet:///modules/mysql-server/my.cnf",
    notify => Service["mysql"],
    require => Package["mysql-server"],
  }
 
  file { "/etc/my.cnf":
    require => File["/var/lib/mysql/my.cnf"],
    ensure => "/var/lib/mysql/my.cnf",
  }

  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -pchangeme status",
    path => ["/bin", "/usr/bin"],
    command => "mysqladmin -uroot password changeme",
    require => Service["mysql"],
  }
}