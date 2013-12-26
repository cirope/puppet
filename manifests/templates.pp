class baseclass {
  include $::osfamily,
    ::vars,
    ::system,
    ::swap,
    ::packages,
    ::services,
    ::user
}

import 'roles'
