class apt {
  exec { "/usr/bin/aptitude update": path => "/usr/bin" }
}