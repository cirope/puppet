class oracle::server::dependencies {
  package { 'binutils':            ensure => present }
  package { 'compat-libstdc++-33': ensure => present }
  package { 'glibc':               ensure => present }
  package { 'ksh':                 ensure => present }
  package { 'libaio':              ensure => present }
  package { 'libgcc':              ensure => present }
  package { 'libstdc++':           ensure => present }
  package { 'make':                ensure => present }
  package { 'compat-libcap1':      ensure => present }
  package { 'gcc':                 ensure => present }
  package { 'gcc-c++':             ensure => present }
  package { 'glibc-devel':         ensure => present }
  package { 'libaio-devel':        ensure => present }
  package { 'libstdc++-devel':     ensure => present }
  package { 'sysstat':             ensure => present }
  package { 'unixODBC-devel':      ensure => present }
  package { 'glibc.i686':          ensure => present }
  package { 'libXext':             ensure => present }
  package { 'libXtst':             ensure => present }
}
