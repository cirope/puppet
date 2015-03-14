class oracle::server::dependencies {
  $packages = [
    'binutils',
    'compat-libstdc++-33',
    'glibc',
    'ksh',
    'libaio',
    'libgcc',
    'libstdc++',
    'make',
    'compat-libcap1',
    'gcc',
    'gcc-c++',
    'glibc-devel',
    'libaio-devel',
    'libstdc++-devel',
    'sysstat',
    'unixODBC-devel',
    'glibc.i686',
    'libXext',
    'libXtst'
  ]

  package { $packages:
    ensure => true
  }
}
