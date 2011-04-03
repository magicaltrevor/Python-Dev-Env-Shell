class apache2 {
  package { "apache2":
   ensure => present,
   require => Class["apt"]
  }
  
  service { "apache2":
    ensure => running,
    require => Package["apache2"]}
}