class phpfpm {
  include phpfpm::install
  include phpfpm::service
  include phpfpm::config
  include phpfpm::pear
}
