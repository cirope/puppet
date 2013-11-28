Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

class { 'apt': }

hiera_include('classes')
hiera_include('classes::extra')

node default {
}
