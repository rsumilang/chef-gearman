name              'gearman'
maintainer        'Richard Sumilang'
maintainer_email  'me@richardsumilang.com'
license           'Apache 2.0'
description       'Builds gearman'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.2.1'

supports 'fedora', '>= 0.0.0'
supports 'redhat', '>= 0.0.0'
supports 'centos', '>= 0.0.0'
supports 'ubuntu', '>= 0.0.0'
supports 'debian', '>= 0.0.0'
supports 'amazon', '>= 0.0.0'
supports 'suse', '>= 0.0.0'
supports 'scientific', '>= 0.0.0'
supports 'oracle', '>= 0.0.0'
supports 'smartos', '>= 0.0.0'
supports 'mac_os_x', '>= 10.6.0'
supports 'mac_os_x_server', '>= 10.6.0'

depends 'apache2'
depends 'apt'
depends 'database'
depends 'mysql'
depends 'php'

recipe 'gearman::default', 'Default recipe'
recipe 'gearman::ext_php', 'Installs PHP extension'
recipe 'gearman::server', 'Downloads and builds gearman server onto machine'