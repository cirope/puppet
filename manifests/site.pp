import 'templates'
import 'nodes'

Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

hiera_include('classes', [])
