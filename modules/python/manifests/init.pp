class python {
    package { "python": ensure => installed, require => Class["apt"] }
    package { "python-pip": ensure => installed, require => Package["python"] }
    package { "python-mysqldb": ensure => installed, require => Package["mysql-server"] }    
}