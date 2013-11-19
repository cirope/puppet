Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

hiera_include('classes')
hiera_include('classes::extra')

node default {
}
